import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_browser/analytics.dart';
import 'package:flutter_browser/helper/util_helper.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/entity/setting.dart';
import 'package:flutter_browser/localize.dart';
import 'package:flutter_browser/controller/settings/settings_controller.dart';
import 'package:flutter_browser/controller/settings/settings_state.dart';
import 'package:flutter_browser/repository/setting_repository.dart';
import 'package:flutter_browser/screen/settings/hosts_screen.dart';
import 'package:flutter_browser/screen/settings/select_host_screen.dart';
import 'package:flutter_browser/screen/settings/select_search_engine_screen.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

final settingsController = StateNotifierProvider((ref) => SettingsController());

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              UtilHelper.showStartupScreen(context);
            }
          },
        ),
      ),
      body: Consumer(
        builder: (context, watch, _) {
          final hosts = watch<SettingsState>(settingsController.state).hosts;
          final setting =
              watch<SettingsState>(settingsController.state).setting;
          return ListView(
            children: [
              /// 基本設定
              _SectionHeader(AppLocalizations.of(context).basicSetting),
              Gap(8),

              /// 設定したサイト検索 または 設定したサイトを除外して検索
              ...DatabaseSetting.getSearchTypes(context)
                  .where((_) => setting != null)
                  .where((x) => x["id"] == setting.searchType)
                  .map(
                (x) {
                  final count = () {
                    final state =
                        watch<SettingsState>(settingsController.state);
                    if (setting.searchType == SettingSearchTypeKind.Include) {
                      return state.includeHosts.length;
                    } else {
                      return state.excludeHosts.length;
                    }
                  }();
                  return _Item(
                    AppLocalizations.of(context).howToSearch,
                    screen: SettingsSelectHostScreen(),
                    subtitle: x["name"] + "（$count）",
                  );
                },
              ).toList(growable: false),
              Divider(),

              /// 登録中のサイト
              _Item(
                AppLocalizations.of(context).registeredWebsites,
                screen: SettingsHostsScreen(),
                subtitle: "${hosts.length}" + AppLocalizations.of(context).unit,
              ),
              Divider(),

              /// 検索エンジン
              ...DatabaseSetting.getSearchEngines(context)
                  .where((_) => setting != null)
                  .where((x) => x["id"] == setting.searchEngine)
                  .map((x) => _Item(
                        AppLocalizations.of(context).searchEngine,
                        screen: SettingsSelectSearchEngineScreen(),
                        subtitle: x["name"],
                      ))
                  .toList(growable: false),
              Divider(),

              /// その他
              _SectionHeader(AppLocalizations.of(context).otherSetting),
              Gap(8),

              /// このアプリを評価する
              _Item(
                AppLocalizations.of(context).reviewApp,
                onTap: () {
                  Analytics.analyticsLogEvent(AnalyticsEventType.openReview);
                  launch(
                    "https://itunes.apple.com/jp/app/id1551822594?mt=8&action=write-review",
                    forceSafariVC: false,
                  );
                },
              ),
              Divider(),

              /// AppStoreで開く
              _Item(
                AppLocalizations.of(context).launchStore,
                onTap: () {
                  Analytics.analyticsLogEvent(AnalyticsEventType.openStore);
                  launch(
                    "https://apps.apple.com/jp/app/id1551822594",
                    forceSafariVC: false,
                  );
                },
              ),
              Divider(),

              /// ご意見、ご要望
              _Item(
                AppLocalizations.of(context).contact,
                onTap: () {
                  Analytics.analyticsLogEvent(AnalyticsEventType.openContact);
                  launch(
                    "https://docs.google.com/forms/d/e/1FAIpQLSdQ7hJ8RwMY0AFzl7a9WjrLK5dskHl1u3pV45KvyoT7zfgDAQ/viewform?usp=sf_link",
                  );
                },
              ),
              Divider(),

              Gap(8),
            ],
          );
        },
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final Widget screen;
  final Function onTap;
  String subtitle;

  _Item(this.title, {this.subtitle, this.screen, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.title),
      subtitle: subtitle != null ? Text(this.subtitle) : null,
      trailing: Icon(
        Icons.keyboard_arrow_right,
        size: 30.0,
      ),
      onTap: onTap != null
          ? onTap
          : () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => screen,
                ),
              );
            },
    );
  }
}
