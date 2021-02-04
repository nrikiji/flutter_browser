import 'package:flutter/material.dart';
import 'package:flutter_browser/repository/host_repository.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/analytics.dart';
import 'package:flutter_browser/helper/util_helper.dart';
import 'package:flutter_browser/localize.dart';
import 'package:flutter_browser/controller/screen/settings_register_host_browser/settings_register_host_browser_screen_state.dart';
import 'package:flutter_browser/controller/screen/settings_register_host_browser/settings_register_host_browser_screen_controller.dart';
import 'package:flutter_browser/screen/settings/settings_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:webview_flutter/webview_flutter.dart';

part 'register_host_browser_appbar.dart';
part 'register_host_browser_footer.dart';

final _screenController = StateNotifierProvider(
    (ref) => SettingsRegisterHostBrowserScreenController());

class RegisterHostBrowser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(elevation: 0),
      ),
      body: Column(
        children: [
          /// ヘッダー(更新ボタン、URL表示、設定ボタン)
          _AppBar(),

          /// プログレスバー
          Consumer(builder: (context, watch, _) {
            final isLoading = watch<SettingsRegisterHostBrowserScreenState>(
                    _screenController.state)
                .isLoading;
            return isLoading ? LinearProgressIndicator() : SizedBox.shrink();
          }),

          /// WebView
          Expanded(
            child: WebView(
              initialUrl: 'https://www.google.com',
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
              onWebViewCreated: (controller) {
                context
                    .read(_screenController)
                    .setWebViewController(controller);
              },
              onPageStarted: (x) {
                context.read(_screenController).startLoading();
              },
              onPageFinished: (x) {
                context.read(_screenController).finishLoading();
              },
              onWebResourceError: (x) {
                Fluttertoast.showToast(
                  msg: AppLocalizations.of(context).failedLoadWeb,
                  fontSize: 18,
                  gravity: ToastGravity.SNACKBAR,
                  toastLength: Toast.LENGTH_LONG,
                );
                context.read(_screenController).finishLoading();
              },
              navigationDelegate: (NavigationRequest request) {
                if (request.isForMainFrame) {
                  var decodedUrl = Uri.decodeFull(request.url);
                  context.read(_screenController).setCurrentUrl(decodedUrl);
                }
                return NavigationDecision.navigate;
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _Footer(),
    );
  }
}
