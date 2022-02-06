import 'dart:async';



import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:xedule_api/xedule_api.dart'
    hide Appointment, Classroom, Group, OrganisationalUnit, Teacher;
import 'package:xedule_repository/xedule_repository.dart';

import 'xedule_auth_in_app_browser.dart';
import 'xedule_authenticated_http_client.dart';

typedef void XeduleAuthCallback(List<Cookie> cookies);

final Uri xeduleUri = Uri.parse('https://sa-han.xedule.nl');
final Uri microsoftLoginUri = Uri.parse('https://login.microsoftonline.com/');

class XeduleRepository {
  XeduleRepository({XeduleApiClient? xeduleApiClient})
      : _xeduleApiClient = xeduleApiClient ?? XeduleApiClient();
  XeduleApiClient _xeduleApiClient;

  void setApiClient(XeduleApiClient client) {
    this._xeduleApiClient = client;
  }

  Future<bool> signIn({bool forceShow = false}) async {
    Completer<bool> completer = Completer();

    final browser = XeduleAuthInAppBrowser(
      onAuthenticated: (cookies) {
        _xeduleApiClient.setHttpClient(
          XeduleAuthenticatedHttpClient(
            authCookies: cookies,
          ),
        );
        completer.complete(true);
      },
      onClosed: () {
        completer.complete(false);
      }
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
