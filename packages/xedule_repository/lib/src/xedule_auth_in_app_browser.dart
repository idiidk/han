import 'dart:async';
import 'dart:ui';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../xedule_repository.dart';

class XeduleAuthInAppBrowser extends InAppBrowser {
  XeduleAuthInAppBrowser({required this.onAuthenticated, this.onClosed});

  bool _allowCloseCallback = false;
  late bool _hidden;
  late InAppBrowserClassOptions _options;
  late Timer? _unauthenticatedTimer = null;

  final XeduleAuthCallback onAuthenticated;
  final VoidCallback? onClosed;

  Future open({bool forceShow = false}) {
    this._hidden = !forceShow;
    this._options = InAppBrowserClassOptions(
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
    );

    return this.openUrlRequest(
      options: _options,
      urlRequest: URLRequest(url: xeduleUri),
    );
  }

  @override
  void onExit() {
    if (_allowCloseCallback) {
      this.onClosed!();
    }
    super.onCloseWindow();
  }

  @override
  void onLoadStart(Uri? url) async {
    if (url == null) {
      super.onLoadStart(url);
      return;
    }

    if (url.host == microsoftLoginUri.host && _hidden) {
      _unauthenticatedTimer = Timer(Duration(seconds: 1), () async {
        _hidden = false;

        final unhiddenOptions = _options.copy();
        unhiddenOptions.crossPlatform.hidden = _hidden;

        _allowCloseCallback = false;
        await this.close();
        _allowCloseCallback = true;

        await this.openUrlRequest(
          options: unhiddenOptions,
          urlRequest: URLRequest(url: xeduleUri),
        );
      });
    } else if (url.host == xeduleUri.host) {
      if (_unauthenticatedTimer != null) {
        _unauthenticatedTimer!.cancel();
      }

      _allowCloseCallback = false;
      await this.close();

      CookieManager cookieManager = CookieManager.instance();
      cookieManager.getCookies(url: xeduleUri).then(this.onAuthenticated);
    }

    super.onLoadStart(url);
  }
}