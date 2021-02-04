import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/analytics.dart';
import 'package:flutter_browser/helper/util_helper.dart';
import 'package:flutter_browser/localize.dart';
import 'package:flutter_browser/controller/screen/settings_edit_host/settings_edit_host_screen_controller.dart';
import 'package:flutter_browser/entity/host.dart';
import 'package:gap/gap.dart';
import 'package:flutter_browser/screen/settings/settings_screen.dart';

final _screenController =
    StateNotifierProvider((ref) => SettingsEditHostScreenController());

class SettingsEditHostScreen extends StatelessWidget {
  final Host host;

  const SettingsEditHostScreen(this.host);

  @override
  Widget build(BuildContext context) {
    final controller = context.read(_screenController)
      ..setDefaultValue(host.url, host.name);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).editWebsite),
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(AppLocalizations.of(context).confirm),
                    content: Text(AppLocalizations.of(context).confirmDelete),
                    actions: [
                      /// キャンセルボタン
                      FlatButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text(AppLocalizations.of(context).cancel),
                      ),

                      /// 削除ボタン
                      FlatButton(
                          onPressed: () async {
                            await context
                                .read(settingsController)
                                .deleteHost(host.id);

                            Analytics.analyticsLogEvent(
                                AnalyticsEventType.deleteHost);

                            UtilHelper.navigatorPopCount(context, 2);
                          },
                          child: const Text("OK")),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: controller.urlTextEditingController,
                maxLines: null,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  floatingLabelBehavior: null,
                  labelText: AppLocalizations.of(context).urlOrHostName,
                  helperText: AppLocalizations.of(context).urlOrHostNameExample,
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                  // TODO(nrikiji): Themeのどこが対象か確認
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor),
                  ),
                ),
              ),
              Gap(16),
              TextFormField(
                controller: controller.nameTextEditingController,
                maxLines: 1,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  floatingLabelBehavior: null,
                  labelText: AppLocalizations.of(context).websiteName,
                  helperText: AppLocalizations.of(context).websiteNameExample,
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                  // TODO(nrikiji): Themeのどこが対象か確認
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor),
                  ),
                ),
              ),
              Gap(32),

              Text(
                AppLocalizations.of(context).hintRegisterHost,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: RaisedButton(
            child: Text(
              AppLocalizations.of(context).register,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () async {
              final url = controller.urlTextEditingController.text;
              final name = controller.nameTextEditingController.text;

              final host = UtilHelper.url2host(url);
              if (host == null) {
                await UtilHelper.showSimpleDialog(
                  context,
                  AppLocalizations.of(context).error,
                  AppLocalizations.of(context).invalidUrl,
                );
                return;
              }

              await context
                  .read(settingsController)
                  .updateHost(this.host.id, host, name);

              Analytics.analyticsLogEvent(AnalyticsEventType.editHost);

              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
