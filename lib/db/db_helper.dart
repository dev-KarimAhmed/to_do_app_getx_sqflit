import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DBHelper {
  static Database? db;

  static const int version = 1;
  static const String tableName = 'tasks';

  static Future<void> initDB() async {
    if (db != null) {
      debugPrint('db is null');
      return;
    } else {
      try {
        String path = await getDatabasesPath() + 'task.db';
        debugPrint('in database path');
        db = await openDatabase(path, version: version,
            onCreate: (Database db, int version) async {
          // When creating the db, create the table
          debugPrint('Creating a new one');
          await db.execute(
              'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'title STRING ,note TEXT, date STRING '
              'startTime STRING ,endTime STRING, '
              'remind INTEGER ,repeat STRING, '
              'color INTEGER, '
              'isCompleted INTEGER)');
        });
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insert(Task? task) async {
    print('insert');
    return await db!.insert(tableName, task!.toJson());
  }

  static Future<int> delete(Task? task) async {
    print('delete');
    return await db!.delete(tableName , where: 'id = ?' , whereArgs: [task!.id]);
  }
  static Future<List<Map<String, Object?>>> query(Task? task) async {
    print('query');
    return await db!.query(tableName);
  }
   static Future<int> update(int id) async {
    print('update');
    return await db!.rawUpdate('''
 UPDATE tasks
 SET isCompleted = ?
 WHERE id = ?
  
''' , [1,id]);
  }
}
