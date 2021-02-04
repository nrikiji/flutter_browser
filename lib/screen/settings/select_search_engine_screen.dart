import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/analytics.dart';
import 'package:flutter_browser/localize.dart';
import 'package:flutter_browser/controller/settings/settings_state.dart';
import 'package:flutter_browser/repository/setting_repository.dart';
import 'package:flutter_browser/screen/settings/settings_screen.dart';

class SettingsSelectSearchEngineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).searchEngine),
        elevation: 1,
      ),
      body: Consumer(
        builder: (context, watch, _) {
          final items = DatabaseSetting.getSearchEngines(context);
          final setting =
              watch<SettingsState>(settingsController.state).setting;
          return Column(
            children: [
              /// 検索エンジン一覧
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          items[index]["name"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        trailing: setting.searchEngine == items[index]["id"]
                            ? Icon(Icons.check)
                            : null,
                        onTap: () {
                          Analytics.analyticsLogEvent(
                              AnalyticsEventType.selectSearchEngine);

                          context
                              .read(settingsController)
                              .updateSettingSearchEngine(items[index]["id"]);
                        },
                      ),
                    );
                  },
                  itemCount: items.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
