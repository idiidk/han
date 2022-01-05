import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:xedule_api/xedule_api.dart'
    hide Appointment, Classroom, Group, OrganisationalUnit, Teacher;
import 'package:xedule_repository/xedule_repository.dart';

typedef void XeduleAuthCallback(List<Cookie> cookies);

final Uri xeduleUri = Uri.parse('https://sa-han.xedule.nl');
final Uri microsoftLoginUri = Uri.parse('https://login.microsoftonline.com/');

class AuthenticatedHttpClient extends http.BaseClient {
  AuthenticatedHttpClient({required this.authCookies});

  final List<Cookie> authCookies;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll({
      'Cookie': authCookies.map((c) => '${c.name}=${c.value}').join('; '),
    });
    return request.send();
  }
}

class XeduleAuthInAppBrowser extends InAppBrowser {
  XeduleAuthInAppBrowser({required this.onAuthenticated});

  late bool _hidden;
  late InAppBrowserClassOptions options;
  late Timer? unauthenticatedTimer = null;

  final XeduleAuthCallback onAuthenticated;

  Future open({bool forceShow = false}) {
    this._hidden = !forceShow;

    return this.openUrlRequest(
      options: InAppBrowserClassOptions(
        inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            disableContextMenu: true,
            javaScriptEnabled: true,
            transparentBackground: true,
          ),
        ),
        crossPlatform: InAppBrowserOptions(
          hidden: _hidden,
          hideToolbarTop: true,
        ),
      ),
      urlRequest: URLRequest(url: xeduleUri),
    );
  }

  @override
  void onLoadStart(Uri? url) async {
    if (url == null) {
      super.onLoadStart(url);
      return;
    }

    if (url.host == microsoftLoginUri.host && _hidden) {
      unauthenticatedTimer = Timer(Duration(seconds: 1), () async {
        _hidden = false;

        final unhiddenOptions = options.copy();
        unhiddenOptions.crossPlatform.hidden = _hidden;

        await this.close();
        await this.openUrlRequest(
          options: unhiddenOptions,
          urlRequest: URLRequest(url: xeduleUri),
        );
      });
    } else if (url.host == xeduleUri.host) {
      if (unauthenticatedTimer != null) {
        unauthenticatedTimer!.cancel();
      }
      await this.close();

      CookieManager cookieManager = CookieManager.instance();
      cookieManager.getCookies(url: xeduleUri).then(this.onAuthenticated);
    }

    super.onLoadStart(url);
  }
}

class XeduleRepository {
  XeduleRepository({XeduleApiClient? xeduleApiClient})
      : _xeduleApiClient = xeduleApiClient ?? XeduleApiClient();
  XeduleApiClient _xeduleApiClient;

  void setApiClient(XeduleApiClient client) {
    this._xeduleApiClient = client;
  }

  Future signIn({bool forceShow = false}) async {
    Completer completer = Completer();

    final browser = XeduleAuthInAppBrowser(
      onAuthenticated: (cookies) {
        _xeduleApiClient.setHttpClient(
          AuthenticatedHttpClient(
            authCookies: cookies,
          ),
        );
        completer.complete();
      },
    );

    await browser.open(forceShow: forceShow);
    return completer.future;
  }

  Future<List<Appointment>> getAppointments(List<String> ids) async {
    final rawAppointments = await _xeduleApiClient.getAppointments(ids);
    List<Appointment> appointments = [];

    for (var appointment in rawAppointments) {
      appointments.add(new Appointment(
        id: appointment.id,
        name: appointment.name,
        start: DateTime.parse(appointment.iStart),
        end: DateTime.parse(appointment.iEnd),
        attributes: appointment.atts,
      ));
    }

    return appointments;
  }

  Future<List<Classroom>> getClassrooms() async {
    final rawClassrooms = await _xeduleApiClient.getClassrooms();
    List<Classroom> classrooms = [];

    for (var classroom in rawClassrooms) {
      classrooms.add(new Classroom(
        id: classroom.id,
        code: classroom.code,
        organisationalUnitIds: classroom.orus,
      ));
    }

    return classrooms;
  }

  Future<List<Group>> getGroups() async {
    final rawGroups = await _xeduleApiClient.getGroups();
    List<Group> groups = [];

    for (var group in rawGroups) {
      groups.add(new Group(
        id: group.id,
        code: group.code,
        organisationalUnitIds: group.orus,
      ));
    }

    return groups;
  }

  Future<List<OrganisationalUnit>> getOrganisationalUnits() async {
    final rawOrganisationalUnits =
        await _xeduleApiClient.getOrganisationalUnits();
    List<OrganisationalUnit> organisationalUnits = [];

    for (var organisationalUnit in rawOrganisationalUnits) {
      organisationalUnits.add(new OrganisationalUnit(
        id: organisationalUnit.id,
        code: organisationalUnit.code,
        timeZone: organisationalUnit.timeZone,
        yearCodes: organisationalUnit.yeas,
      ));
    }

    return organisationalUnits;
  }

  Future<List<Teacher>> getTeachers() async {
    final rawTeachers = await _xeduleApiClient.getTeachers();
    List<Teacher> teachers = [];

    for (var teacher in rawTeachers) {
      teachers.add(new Teacher(
        id: teacher.id,
        code: teacher.code,
        name: teacher.name,
      ));
    }

    return teachers;
  }
}
