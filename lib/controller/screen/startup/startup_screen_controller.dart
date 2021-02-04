import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_browser/controller/screen/startup/startup_screen_state.dart';
import 'package:flutter_browser/entity/setting.dart';
import 'package:flutter_browser/localize.dart';
import 'package:flutter_browser/repository/host_repository.dart';
import 'package:flutter_browser/repository/setting_repository.dart';
import 'package:flutter_browser/screen/browser/browser_screen.dart';

class StartupScreenController extends StateNotifier<StartupScreenState> {
  // テキストフィールド
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  StartupScreenController() : super(StartupScreenState());

  void searchKeyword(BuildContext context) async {
    final text = textEditingController.value.text;
    String postfix;
    final setting = await DatabaseSetting.get();

    // 検索エンジンごとのURL
    String baseUrl;
    if (setting.searchEngine == SettingSearchEngineKind.Google) {
      baseUrl = AppLocalizations.of(context).searchEngineGoogleUrl;
    } else if (setting.searchEngine == SettingSearchEngineKind.Bing) {
      baseUrl = AppLocalizations.of(context).searchEngineBingUrl;
    } else if (setting.searchEngine == SettingSearchEngineKind.Yahoo) {
      baseUrl = AppLocalizations.of(context).searchEngineYahooUrl;
    }

    // 結果に含めるまたは除外
    if (setting.searchType == SettingSearchTypeKind.Include) {
      final includeHosts = await HostRepository.findInclude();
      postfix = includeHosts.map((x) => "site://${x.url}").join(" OR ");
    } else {
      final excludeHosts = await HostRepository.findExclude();
      postfix = excludeHosts.map((x) => "-site://${x.url}").join(" ");
    }

    String keyword;
    if (setting.searchEngine == SettingSearchEngineKind.Google ||
        setting.searchEngine == SettingSearchEngineKind.Yahoo) {
      keyword = Uri.encodeComponent(text + " " + postfix);
    } else {
      keyword = Uri.encodeComponent(text + " (" + postfix + ")");
    }

    final url = baseUrl + keyword;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => BrowserScreen(url),
        fullscreenDialog: true,
      ),
    );
  }
}
