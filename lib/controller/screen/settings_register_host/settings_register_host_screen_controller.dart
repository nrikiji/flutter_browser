import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/controller/screen/settings_register_host/settings_register_host_screen_state.dart';

class SettingsRegisterHostScreenController
    extends StateNotifier<SettingsRegisterHostScreenState> {
  TextEditingController urlTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();

  SettingsRegisterHostScreenController()
      : super(SettingsRegisterHostScreenState());

  setDefaultValue() {
    urlTextEditingController.text = "";
    nameTextEditingController.text = "";
  }
}
