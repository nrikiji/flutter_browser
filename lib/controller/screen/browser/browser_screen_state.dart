import 'package:flutter/foundation.dart';
import 'package:flutter_browser/repository/host_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'browser_screen_state.freezed.dart';

@freezed
abstract class BrowserScreenState with _$BrowserScreenState {
  factory BrowserScreenState({
    bool isLoading,
    bool checked,
    String currentUrl,
  }) = _Create;

  @late
  String get currentHostName =>
      currentUrl == null ? "" : Uri.parse(currentUrl).host;

  @late
  bool get isSearchEngine =>
      HostRepository.searchEngineHosts.contains(currentHostName);
}
