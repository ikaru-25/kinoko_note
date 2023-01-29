import 'package:sqflite/sqflite.dart' as sql;
import 'sql_helper.dart';
import 'package:flutter/foundation.dart';


class FieldTBL {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE fields(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      address TEXT,
      description TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }

  static Future<int> createField(String name, String? address, String? descrption) async {
    final db = await SQLHelper.db();

    final data = {'name': name, 'address':address, 'description': descrption};
    final id = await db.insert('fields', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all fields (journals)
  static Future<List<Map<String, dynamic>>> getFields() async {
    final db = await SQLHelper.db();
    return db.query('fields', orderBy: "id");
  }

  // Read a single field by id
  static Future<List<Map<String, dynamic>>> getField(int id) async {
    final db = await SQLHelper.db();
    return db.query('fields', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an field by id
  static Future<int> updateField(
      int id, String name, String? address,  String? descrption) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'address': address,
      'description': descrption,
      'createdAt': DateTime.now().toString()
    };
    

    final result =
        await db.update('fields', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteField(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("fields", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an field: $err");
    }
  }
}