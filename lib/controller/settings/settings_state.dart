import 'package:flutter/foundation.dart';
import 'package:flutter_browser/entity/host.dart';
import 'package:flutter_browser/entity/setting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  factory SettingsState({
    Setting setting,
    List<Host> hosts,
  }) = _Create;

  @late
  List<Host> get includeHosts => hosts.where((x) => x.include).toList(growable: false);

  @late
  List<Host> get excludeHosts => hosts.where((x) => x.exclude).toList(growable: false);

  @late
  String get includeHostName => 3 <= includeHosts.length ? includeHosts.sublist(0, 3).map((x) => x.name).join(" ") : includeHosts.map((x) => x.name).join(" ");

  @late
  String get excludeHostName => 3 <= excludeHosts.length ? excludeHosts.sublist(0, 3).map((x) => x.name).join(" ") : excludeHosts.map((x) => x.name).join(" ");

  @late
  bool get isIncludeHostMore => 3 < includeHosts.length;

  @late
  bool get isExcludeHostMore => 3 < excludeHosts.length;
}
