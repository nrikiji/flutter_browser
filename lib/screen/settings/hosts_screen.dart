import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/localize.dart';
import 'package:flutter_browser/controller/settings/settings_state.dart';
import 'package:flutter_browser/screen/settings/edit_host_screen.dart';
import 'package:flutter_browser/screen/settings/register_host_browser/register_host_browser_screen.dart';
import 'package:flutter_browser/screen/settings/register_host_screen.dart';
import 'package:flutter_browser/screen/settings/settings_screen.dart';

class SettingsHostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).registeredWebsites),
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showConfirmDialog(context),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, watch, _) {
          final hosts = watch<SettingsState>(settingsController.state).hosts;
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
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    size: 30.0,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            SettingsEditHostScreen(hosts[index]),
                        //fullscreenDialog: true,
                      ),
                    );
                  },
                ),
              );
            },
            itemCount: hosts.length,
          );
        },
      ),
    );
  }

  showConfirmDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text(AppLocalizations.of(context).register),
      content: Text(AppLocalizations.of(context).registrationMethod),
      actions: [
        FlatButton(
          child: Text(AppLocalizations.of(context).enterManually),
          onPressed: () async {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SettingsRegisterHostScreen(),
                fullscreenDialog: true,
              ),
            );
          },
        ),
        FlatButton(
          child: Text(
            AppLocalizations.of(context).launchBrowser,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RegisterHostBrowser(),
                fullscreenDialog: true,
              ),
            );
          },
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
