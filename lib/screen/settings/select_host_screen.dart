import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/analytics.dart';
import 'package:flutter_browser/entity/setting.dart';
import 'package:flutter_browser/localize.dart';
import 'package:flutter_browser/controller/settings/settings_state.dart';
import 'package:flutter_browser/entity/host.dart';
import 'package:flutter_browser/repository/setting_repository.dart';
import 'package:flutter_browser/screen/settings/settings_screen.dart';

class SettingsSelectHostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).howToSearch),
        elevation: 1,
      ),
      body: Consumer(
        builder: (context, watch, _) {
          final items = DatabaseSetting.getSearchTypes(context);
          final hosts = watch<SettingsState>(settingsController.state).hosts;
          final setting =
              watch<SettingsState>(settingsController.state).setting;
          return Column(
            children: [
              /// プルダウン
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DropdownButtonFormField(
                        value: setting?.searchType,
                        items: items
                            .map(
                              (x) => DropdownMenuItem<SettingSearchTypeKind>(
                                value: x["id"],
                                child: Text(x["name"]),
                              ),
                            )
                            .toList(growable: false),
                        onChanged: (x) async {
                          await context
                              .read(settingsController)
                              .updateSettingSearchType(x);

                          if (x == 1) {
                            Analytics.analyticsLogEvent(
                                AnalyticsEventType.selectSearchTypeInclude);
                          } else if (x == 2) {
                            Analytics.analyticsLogEvent(
                                AnalyticsEventType.selectSearchTypeExclude);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),

              /// ホスト名一覧
              Expanded(
                child: setting.searchType == SettingSearchTypeKind.Include
                    ? _IncludeList(hosts)
                    : _ExcludeList(hosts),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _IncludeList extends StatelessWidget {
  final List<Host> hosts;

  const _IncludeList(this.hosts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              hosts[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(hosts[index].url),
            trailing: hosts[index].include ? Icon(Icons.check) : null,
            onTap: () {
              Analytics.analyticsLogEvent(AnalyticsEventType.selectIncludeHost);

              context.read(settingsController).updateHostInclude(
                    hosts[index].id,
                    !hosts[index].include,
                  );
            },
          ),
        );
      },
      itemCount: hosts.length,
    );
  }
}

class _ExcludeList extends StatelessWidget {
  final List<Host> hosts;

  const _ExcludeList(this.hosts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              hosts[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(hosts[index].url),
            trailing: hosts[index].exclude ? Icon(Icons.check) : null,
            onTap: () {
              Analytics.analyticsLogEvent(AnalyticsEventType.selectExcludeHost);

              context.read(settingsController).updateHostExclude(
                    hosts[index].id,
                    !hosts[index].exclude,
                  );
            },
          ),
        );
      },
      itemCount: hosts.length,
    );
  }
}
