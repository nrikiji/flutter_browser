import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/controller/settings/settings_state.dart';
import 'package:flutter_browser/entity/setting.dart';
import 'package:flutter_browser/repository/host_repository.dart';
import 'package:flutter_browser/repository/setting_repository.dart';

class SettingsController extends StateNotifier<SettingsState> {
  SettingsController() : super(SettingsState(hosts: [])) {
    HostRepository.all().then((x) => state = state.copyWith.call(hosts: x));
    DatabaseSetting.get().then((x) => state = state.copyWith.call(setting: x));
  }

  Future registerHost(String url, String name, {bool exclude = false}) async {
    final host = await HostRepository.findHost(url);
    if (host != null) {
      await HostRepository.delete(host.id);
    }
    await HostRepository.insert(url, name, exclude);
    _refreshHost();
  }

  Future updateSettingSearchEngine(SettingSearchEngineKind searchEngine) async {
    await DatabaseSetting.updateSearchEngine(searchEngine);
    _refreshSetting();
  }

  Future updateSettingSearchType(SettingSearchTypeKind searchType) async {
    await DatabaseSetting.updateSearchType(searchType);
    _refreshSetting();
  }

  Future updateHost(int id, String url, String name) async {
    await HostRepository.update(id, url, name);
    _refreshHost();
  }

  Future updateHostInclude(int id, bool value) async {
    await HostRepository.updateInclude(id, value);
    _refreshHost();
  }

  Future updateHostExclude(int id, bool value) async {
    await HostRepository.updateExclude(id, value);
    _refreshHost();
  }

  Future deleteHost(int id) async {
    await HostRepository.delete(id);
    _refreshHost();
  }

  void _refreshSetting() async {
    final setting = await DatabaseSetting.get();
    state = state.copyWith.call(setting: setting);
  }

  void _refreshHost() async {
    final hosts = await HostRepository.all();
    state = state.copyWith.call(hosts: hosts);
  }
}
