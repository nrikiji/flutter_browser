import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/analytics.dart';
import 'package:flutter_browser/helper/util_helper.dart';
import 'package:flutter_browser/localize.dart';
import 'package:flutter_browser/controller/screen/settings_register_host/settings_register_host_screen_controller.dart';
import 'package:flutter_browser/screen/settings/settings_screen.dart';
import 'package:gap/gap.dart';

final _screenController =
    StateNotifierProvider((ref) => SettingsRegisterHostScreenController());

class SettingsRegisterHostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.read(_screenController)..setDefaultValue();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).registerWebsite),
        elevation: 1,
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// URL
              TextFormField(
                maxLines: null,
                controller: controller.urlTextEditingController,
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

              /// サイト名
              TextFormField(
                controller: controller.nameTextEditingController,
                maxLines: 1,
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

              Analytics.analyticsLogEvent(AnalyticsEventType.registerHost);

              await context.read(settingsController).registerHost(host, name);

              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
