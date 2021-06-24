import 'package:sqflite/sqflite.dart';

import 'package:plugins_sqflite/utils/files.dart';


class DbHelper {
  static Database? _db;
  static final DbHelper _singleton = DbHelper._instance();

  DbHelper._instance();

  factory DbHelper() {
    return _singleton;
  }

  Future<Database> get db async {
    if (_db == null) {
      _db = await initialize();
    }
    return _db!;
  }

  Future<Database> initialize() async {
    String dbFilePath = await Files.getDbFilePath();
    Database database = await openDatabase(
      dbFilePath,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT, description TEXT, priority INTEGER, date TEXT)');
    });

    return database;
  }
}