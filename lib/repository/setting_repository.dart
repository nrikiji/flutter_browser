import 'package:flutter/material.dart';
import 'package:flutter_browser/entity/setting.dart';
import 'package:flutter_browser/helper/database_helper.dart';
import 'package:flutter_browser/localize.dart';

class DatabaseSetting {
  static final table = "settings";

  static List<Map<String, dynamic>> getSearchEngines(BuildContext context) {
    return [
      {
        "id": SettingSearchEngineKind.Google,
        "name": AppLocalizations.of(context).searchEngineGoogle
      },
      {
        "id": SettingSearchEngineKind.Bing,
        "name": AppLocalizations.of(context).searchEngineBing
      },
      {
        "id": SettingSearchEngineKind.Yahoo,
        "name": AppLocalizations.of(context).searchEngineYahoo
      },
    ];
  }

  static List<Map<String, dynamic>> getSearchTypes(BuildContext context) {
    return [
      {
        "id": SettingSearchTypeKind.Include,
        "name": AppLocalizations.of(context).searchMethod1
      },
      {
        "id": SettingSearchTypeKind.Exclude,
        "name": AppLocalizations.of(context).searchMethod2
      },
    ];
  }

  static Future<Setting> get() async {
    final database = DataBaseHelper.database;
    final result = await database.query(table);
    final setting = Setting.fromMap(result.first);
    return Future.value(setting);
  }

  static Future updateSearchEngine(SettingSearchEngineKind searchEngine) async {
    final database = DataBaseHelper.database;
    await database.rawUpdate(
      "UPDATE $table SET search_engine = ?",
      [searchEngine.value],
    );
  }

  static Future updateSearchType(SettingSearchTypeKind searchType) async {
    final database = DataBaseHelper.database;
    await database.rawUpdate(
      "UPDATE $table SET search_type = ?",
      [searchType.value],
    );
  }
}
