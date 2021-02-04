import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/controller/screen/settings_register_host_browser/settings_register_host_browser_screen_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsRegisterHostBrowserScreenController extends StateNotifier<SettingsRegisterHostBrowserScreenState> {
  // WebView
  WebViewController webViewController;

  SettingsRegisterHostBrowserScreenController()
      : super(SettingsRegisterHostBrowserScreenState(isLoading: false));

  void setWebViewController(WebViewController controller) {
    webViewController = controller;
  }

  void setCurrentUrl(String currentUrl) {
    state = state.copyWith.call(currentUrl: currentUrl);
  }

  void reload() {
    webViewController.reload();
  }

  void startLoading() {
    state = state.copyWith.call(isLoading: true);
  }

  void finishLoading() {
    state = state.copyWith.call(isLoading: false);
  }

  void goBack() {
    webViewController.goBack();
  }

  void goForward() {
    webViewController.goForward();
  }
}
