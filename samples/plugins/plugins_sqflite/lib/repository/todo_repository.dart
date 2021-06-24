import 'package:plugins_sqflite/model/todo.dart';
import 'package:plugins_sqflite/utils/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class TodoRepository {
  static final String dbTable = 'todo';
  static final String idColumn = 'id';
  static final String titleColumn = 'title';
  static final String descriptionColumn = 'description';
  static final String priorityColumn = 'priority';
  static final String dateColumn = 'date';

  static final DbHelper _dbHelper = DbHelper();

  static Future<int> count() async {
    Database db = await _dbHelper.db;
    return Sqflite.firstIntValue(
      await db.rawQuery('SELECT count(*) FROM $dbTable')
    ) ?? 0;
  }

  static Future<List<Todo>> getAll() async {
    List<Todo> result = [];
    Database db = await _dbHelper.db;
    var dynamicList = await db.rawQuery('SELECT * FROM $dbTable ORDER BY $priorityColumn ASC');

    for (var item in dynamicList) {
      result.add(Todo.fromObject(item));
    }

    return result;
  }

  static Future<int> insert(Todo todo) async {
    Database db = await _dbHelper.db;
    return await db.insert(dbTable, todo.toMap());
  }

  static Future<int> update(Todo todo) async {
    Database db = await _dbHelper.db;
    return await db.update(
      dbTable,
      todo.toMap(),
      where: '$idColumn = ?',
      whereArgs: [ todo.id ]
    );
  }

  static Future<int> delete(int id) async {
    Database db = await _dbHelper.db;
    return await db.rawDelete('DELETE FROM $dbTable WHERE $idColumn = $id');
  }
}
