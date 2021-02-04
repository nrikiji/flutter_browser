import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_edit_host_screen_state.freezed.dart';

@freezed
abstract class SettingsEditHostScreenState with _$SettingsEditHostScreenState {
  factory SettingsEditHostScreenState() = _Create;
}
