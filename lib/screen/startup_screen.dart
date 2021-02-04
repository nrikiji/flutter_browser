import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/analytics.dart';
import 'package:flutter_browser/controller/screen/startup/startup_screen_controller.dart';
import 'package:flutter_browser/controller/settings/settings_state.dart';
import 'package:flutter_browser/entity/setting.dart';
import 'package:flutter_browser/localize.dart';
import 'package:flutter_browser/main.dart';
import 'package:flutter_browser/screen/settings/settings_screen.dart';
import 'package:gap/gap.dart';
import 'package:sprintf/sprintf.dart';

// ignore: top_level_function_literal_block
final _screenController = StateNotifierProvider((ref) {
  final keyword = ref.watch(appController.state).lastKeyword;
  final controller = StartupScreenController();
  controller.textEditingController.text = keyword;
  return controller;
});

class StartupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.read(_screenController);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(elevation: 0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /// 設定ボタン
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: InkWell(
                        child: Icon(Icons.settings, size: 28),
                        excludeFromSemantics: true,
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => SettingsScreen(),
                              fullscreenDialog: true,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).letsSearch,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      Gap(8),
                      Text(
                        AppLocalizations.of(context).startupCaption,
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.left,
                      ),
                      Gap(8),
                      Consumer(builder: (context, watch, _) {
                        final state =
                            watch<SettingsState>(settingsController.state);

                        if (state.setting == null) {
                          return SizedBox.shrink();
                        }

                        /// 例）現在、Instagram から検索するように設定されています
                        String caption = () {
                          final localize = AppLocalizations.of(context);
                          if (state.setting.searchType == SettingSearchTypeKind.Include &&
                              state.includeHostName.isNotEmpty) {
                            return state.isIncludeHostMore
                                ? sprintf(localize.startupIncludeCaption,
                                    [state.includeHostName])
                                : sprintf(localize.startupIncludeCaption2,
                                    [state.includeHostName]);
                          } else if (state.setting.searchType == SettingSearchTypeKind.Exclude &&
                              state.excludeHostName.isNotEmpty) {
                            return state.isExcludeHostMore
                                ? sprintf(localize.startupExcludeCaption,
                                    [state.excludeHostName])
                                : sprintf(localize.startupExcludeCaption2,
                                    [state.excludeHostName]);
                          } else {
                            return AppLocalizations.of(context)
                                .startupNotFoundCaption;
                          }
                        }();

                        return Text(
                          caption,
                          style: Theme.of(context).textTheme.caption,
                          textAlign: TextAlign.center,
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: TextField(
                  autofocus: true,
                  textInputAction: TextInputAction.search,
                  controller: controller.textEditingController,
                  onEditingComplete: () {
                    /// 検索キーワード保存
                    context
                        .read(appController)
                        .setLastKeyword(controller.textEditingController.text);

                    Analytics.analyticsLogEvent(AnalyticsEventType.search);

                    /// 検索実行
                    controller.searchKeyword(context);
                  },
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).searchKeyword,
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    isDense: true,
                    suffixIcon: InkWell(
                      child: Icon(
                        Icons.cancel_outlined,
                        color: Theme.of(context).accentColor,
                      ),
                      excludeFromSemantics: true,
                      onTap: () => controller.textEditingController.clear(),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minHeight: 16,
                      minWidth: 32,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
