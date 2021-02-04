import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/controller/screen/browser/browser_screen_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserScreenController extends StateNotifier<BrowserScreenState> {
  // テキストフィールド
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  KeyboardVisibilityController keyboardVisibilityController =
      KeyboardVisibilityController();

  // WebView
  WebViewController webViewController;

  BrowserScreenController()
      : super(BrowserScreenState(isLoading: false, checked: false));

  void setWebViewController(WebViewController controller) {
    webViewController = controller;
  }

  void setCurrentUrl(String currentUrl) {
    state = state.copyWith.call(currentUrl: currentUrl);
  }

  void setChecked(bool checked) {
    state = state.copyWith.call(checked: checked);
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
