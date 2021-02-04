import 'package:flutter_browser/entity/host.dart';
import 'package:flutter_browser/helper/database_helper.dart';

class HostRepository {
  static final table = "hosts";

  static final searchEngineHosts = [
    "www.google.com",
    "www.bing.com",
    "search.yahoo.co.jp",
    "search.yahoo.com",
  ];

  static Future<List<Host>> all() async {
    final database = DataBaseHelper.database;
    final result = await database.query(table, orderBy: "id desc");
    final hosts = result.map((x) => Host.fromMap(x));
    return Future.value(hosts.toList(growable: false));
  }

  static Future<Host> findHost(String url) async {
    final database = DataBaseHelper.database;
    final result =
        await database.rawQuery("SELECT * FROM $table WHERE url like ?", [url]);
    if (result.isEmpty) {
      return null;
    }

    return Host.fromMap(result.first);
  }

  static Future<List<Host>> findInclude() async {
    final database = DataBaseHelper.database;
    final result = await database.rawQuery(
      "SELECT * FROM $table WHERE include = 1",
    );
    final hosts = result.map((x) => Host.fromMap(x));
    return Future.value(hosts.toList(growable: false));
  }

  static Future<List<Host>> findExclude() async {
    final database = DataBaseHelper.database;
    final result = await database.rawQuery(
      "SELECT * FROM $table WHERE exclude = 1",
    );
    final hosts = result.map((x) => Host.fromMap(x));
    return Future.value(hosts.toList(growable: false));
  }

  static Future insert(String url, String name, bool exclude) async {
    final database = DataBaseHelper.database;
    await database.insert(
      table,
      {
        "url": url,
        "name": name == null || name.isEmpty ? url : name,
        "exclude": exclude ? 1 : 0,
        "created_at": DateTime.now().toUtc().toIso8601String(),
      },
    );
  }

  static Future update(int id, String url, String name) async {
    final database = DataBaseHelper.database;
    await database.rawUpdate(
      "UPDATE $table SET url = ?, name = ? WHERE id = ?",
      [
        url,
        name == null || name.isEmpty ? url : name,
        id,
      ],
    );
  }

  static Future updateInclude(int id, bool value) async {
    final database = DataBaseHelper.database;
    await database.rawUpdate(
      "UPDATE $table SET include = ? WHERE id = ?",
      [value ? 1 : 0, id],
    );
  }

  static Future updateExclude(int id, bool value) async {
    final database = DataBaseHelper.database;
    await database.rawUpdate(
      "UPDATE $table SET exclude = ? WHERE id = ?",
      [value ? 1 : 0, id],
    );
  }

  static Future delete(int id) async {
    final database = DataBaseHelper.database;
    await database.rawDelete(
      "DELETE FROM $table WHERE id = ?",
      [id],
    );
  }
}
