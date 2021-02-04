import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    SettingsSelectHostScreen(),
                    subtitle: x["name"] + "（$count）",
                  );
                },
              ).toList(growable: false),
              Divider(),

              /// 登録中のサイト
              _Item(
                AppLocalizations.of(context).registeredWebsites,
                SettingsHostsScreen(),
                subtitle: "${hosts.length}" + AppLocalizations.of(context).unit,
              ),
              Divider(),

              /// 検索エンジン
              ...DatabaseSetting.getSearchEngines(context)
                  .where((_) => setting != null)
                  .where((x) => x["id"] == setting.searchEngine)
                  .map((x) => _Item(
                        AppLocalizations.of(context).searchEngine,
                        SettingsSelectSearchEngineScreen(),
                        subtitle: x["name"],
                      ))
                  .toList(growable: false),
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
  String subtitle;

  _Item(this.title, this.screen, {this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.title),
      subtitle: subtitle != null ? Text(this.subtitle) : null,
      trailing: Icon(
        Icons.keyboard_arrow_right,
        size: 30.0,
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
    );
  }
}
