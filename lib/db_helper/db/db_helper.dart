import 'package:fitness_tracker/Models/view_health_records_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("health.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE health_records (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        steps INTEGER,
        calories INTEGER,
        water INTEGER,
        sleep REAL
      )
    ''');
  }

  // INSERT
  Future<int> insertRecord(HealthRecord record) async {
    final db = await instance.database;
    return await db.insert("health_records", record.toMap());
  }

  // FETCH
  Future<List<HealthRecord>> fetchRecords() async {
    final db = await instance.database;
    final result = await db.query("health_records", orderBy: "date DESC");
    return result.map((e) => HealthRecord.fromMap(e)).toList();
  }

  // UPDATE
  Future<int> updateRecord(HealthRecord record) async {
    final db = await instance.database;
    return await db.update(
      "health_records",
      record.toMap(),
      where: "id = ?",
      whereArgs: [record.id],
    );
  }

  // DELETE
  Future<int> deleteRecord(int id) async {
    final db = await instance.database;
    return await db.delete(
      "health_records",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
