import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final dbname = "browser_database.db";
  static final version = 1;
  static Database database;

  static Future initialize() async {
    var databasesPath = await getDatabasesPath();
    final path = join(databasesPath, dbname);

    // TODO(nrikiji): デバッグ用
    //await deleteDatabase(path);

    database = await openDatabase(
      path,
      version: version,
      onCreate: (database, version) async {
        // データベース初期化
        await database.execute(
          "CREATE TABLE IF NOT EXISTS settings ("
          "search_engine INTEGER DEFAULT 1," // 1:Google、2:Bing、3:Yahoo
          "search_type INTEGER DEFAULT 1," // 1:設定したサイトから検索、2:設定したサイトを除外して検索
          "created_at TEXT"
          ");",
        );

        await database.execute(
          "CREATE TABLE IF NOT EXISTS hosts ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name TEXT,"
          "url TEXT,"
          "include INTEGER DEFAULT 0," // 0:無効、1:有効
          "exclude INTEGER DEFAULT 0," // 0:無効、1:有効
          "created_at TEXT"
          ");",
        );

        await database.execute(
          "CREATE TABLE IF NOT EXISTS search_groups ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name TEXT,"
          "enable INTEGER DEFAULT 0,"
          "created_at TEXT"
          ");",
        );

        await database.execute(
          "CREATE TABLE IF NOT EXISTS search_group_hosts ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "search_group_id INTEGER,"
          "host_id INTEGER,"
          "created_at TEXT"
          ");",
        );

        // 初期データ登録
        await database.transaction(
          (txn) async {
            await txn.insert("settings", {
              "search_engine": 1,
              "search_type": 1,
              "created_at": DateTime.now().toUtc().toIso8601String(),
            });

            await txn.insert("hosts", {
              "name": "Youtube",
              "url": "youtube.com",
              "include": 1,
              "exclude": 0,
              "created_at": DateTime.now().toUtc().toIso8601String(),
            });
            await txn.insert("hosts", {
              "name": "Twitter",
              "url": "twitter.com",
              "include": 1,
              "exclude": 0,
              "created_at": DateTime.now().toUtc().toIso8601String(),
            });
            await txn.insert("hosts", {
              "name": "Facebook",
              "url": "facebook.com",
              "include": 1,
              "exclude": 0,
              "created_at": DateTime.now().toUtc().toIso8601String(),
            });
            await txn.insert("hosts", {
              "name": "Instagram",
              "url": "instagram.com",
              "include": 1,
              "exclude": 0,
              "created_at": DateTime.now().toUtc().toIso8601String(),
            });
          },
        );
      },
    );
  }
}
