import 'package:sqflite/sqflite.dart' as sql;
import 'field.dart';


class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await FieldTBL.createTable(database);

    await database.execute("""CREATE TABLE events(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      field_id INTEGER,
      description TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
    await database.execute("""CREATE TABLE birdsMaster(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      species TEXT,
      description TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
    await database.execute("""CREATE TABLE observation(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      event_id INTEGER,
      field_id INTEGER,
      count INTEGER,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'birdwalk.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        // await database.delete("fields");
        
        
        await createTables(database);
      },
    );
  }
}