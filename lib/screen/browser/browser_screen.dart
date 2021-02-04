import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_browser/analytics.dart';
import 'package:flutter_browser/controller/settings/settings_state.dart';
import 'package:flutter_browser/entity/setting.dart';
import 'package:flutter_browser/helper/util_helper.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/main.dart';
import 'package:flutter_browser/controller/screen/browser/browser_screen_controller.dart';
import 'package:flutter_browser/controller/screen/browser/browser_screen_state.dart';
import 'package:flutter_browser/localize.dart';
import 'package:flutter_browser/screen/settings/settings_screen.dart';
import 'package:gap/gap.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'browser_appbar.dart';
part 'browser_footer.dart';

// ignore: top_level_function_literal_block
final _screenController = StateNotifierProvider((ref) {
  final keyword = ref.watch(appController.state).lastKeyword;
  final controller = BrowserScreenController();
  controller.textEditingController.text = keyword;
  return controller;
});

class BrowserScreen extends StatelessWidget {
  final String url;

  const BrowserScreen(this.url);

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
            final isLoading =
                watch<BrowserScreenState>(_screenController.state).isLoading;
            return isLoading ? LinearProgressIndicator() : SizedBox.shrink();
          }),

          /// WebView
          Expanded(
            child: WebView(
              initialUrl: url,
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
                if (x.errorCode != -999 || x.errorType != null) {
                  Fluttertoast.showToast(
                    msg: AppLocalizations.of(context).failedLoadWeb,
                    fontSize: 18,
                    gravity: ToastGravity.SNACKBAR,
                    toastLength: Toast.LENGTH_LONG,
                  );
                }
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

      bottomNavigationBar: SafeArea(
        child: _Footer(),
      ),

      /// 検索開始ボタン
      floatingActionButton: Consumer(
        builder: (context, watch, _) {
          final searchType =
              watch<SettingsState>(settingsController.state).setting.searchType;
          final isSearchEngine =
              watch<BrowserScreenState>(_screenController.state).isSearchEngine;
          if (isSearchEngine || searchType == SettingSearchTypeKind.Include) {
            return FloatingActionButton(
              onPressed: () => UtilHelper.showStartupScreen(context),
              child: Icon(Icons.search),
            );
          } else {
            return FloatingActionButton(
              onPressed: () => showRegisterHostDialog(context),
              child: Icon(Icons.add),
            );
          }
        },
      ),
    );
  }

  void showRegisterHostDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        final url = context.read(_screenController.state).currentUrl;
        final host = UtilHelper.url2host(url);
        final setting = context.read(settingsController.state).setting;
        return AlertDialog(
          title: Text(host),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppLocalizations.of(context).confirmRegister2),
              Gap(16),
              if (setting.searchType == SettingSearchTypeKind.Exclude)
                ListTileTheme(
                  contentPadding: EdgeInsets.all(0),
                  child: Consumer(
                    builder: (context, watch, _) => CheckboxListTile(
                      title: Text(AppLocalizations.of(context).excludeHost),
                      value: watch<BrowserScreenState>(_screenController.state)
                          .checked,
                      onChanged: (x) =>
                          context.read(_screenController).setChecked(x),
                    ),
                  ),
                ),
            ],
          ),
          actions: [
            /// キャンセルボタン
            FlatButton(
              onPressed: Navigator.of(context).pop,
              child: Text(AppLocalizations.of(context).cancel),
            ),

            /// はい
            FlatButton(
              onPressed: () async {
                final url = context.read(_screenController.state).currentUrl;
                final host = UtilHelper.url2host(url);
                final name = host;
                final exclude = () {
                  if (setting.searchType == SettingSearchTypeKind.Include)
                    return false;
                  else
                    return context.read(_screenController.state).checked;
                }();

                await context
                    .read(settingsController)
                    .registerHost(host, name, exclude: exclude);

                Analytics.analyticsLogEvent(
                    AnalyticsEventType.registerHostSearchBrowser);

                Navigator.of(context).pop();
              },
              child: const Text("はい"),
            ),
          ],
        );
      },
    );
  }
}
