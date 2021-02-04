import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/controller/screen/settings_edit_host/settings_edit_host_screen_state.dart';

class SettingsEditHostScreenController
    extends StateNotifier<SettingsEditHostScreenState> {
  TextEditingController urlTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();

  SettingsEditHostScreenController() : super(SettingsEditHostScreenState());

  setDefaultValue(String url, String name) {
    urlTextEditingController.text = url;
    nameTextEditingController.text = name;
  }
}
