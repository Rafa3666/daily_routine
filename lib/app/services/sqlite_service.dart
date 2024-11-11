import 'package:daily_routine/app/models/labor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, "database.db"),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Labor(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, subtitle TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> createItem(Labor labor) async {
    final Database db = await initializeDB();
    final int id = await db.insert("Labor", labor.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    return id;
  }

  Future<List<Labor>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query("Labor");
    return queryResult.map((e) => Labor.fromMap(e)).toList();
  }

  Future<void> updateItem(int id, String newTitle, String newSubtitle) async {
    final db = await initializeDB();
    try {
      await db.update(
        "Labor",
        {
          "title": newTitle,
          "subtitle": newSubtitle,
        },
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (err) {
      debugPrint("Something went wrong when updating an item: $err");
    } finally {
      await db.close();
    }
  }


  Future<void> deleteItem(String title) async {
    final db = await initializeDB();
    try {
      await db.delete("Labor", where: "title = ?", whereArgs: [title]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    } finally {
      await db.close();
    }
  }
}
