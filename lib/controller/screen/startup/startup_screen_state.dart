import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_screen_state.freezed.dart';

@freezed
abstract class StartupScreenState with _$StartupScreenState {
  factory StartupScreenState(
  ) = _Create;
}
