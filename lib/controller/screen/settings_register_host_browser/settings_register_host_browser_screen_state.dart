import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_register_host_browser_screen_state.freezed.dart';

@freezed
abstract class SettingsRegisterHostBrowserScreenState with _$SettingsRegisterHostBrowserScreenState {
  factory SettingsRegisterHostBrowserScreenState({
    bool isLoading,
    String currentUrl,
  }) = _Create;
}
