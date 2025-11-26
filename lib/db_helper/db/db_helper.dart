// lib/db_helper/db/db_helper.dart
import 'package:fitness_tracker/Models/view_health_records_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  // Singleton pattern
  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('health_records.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    print('DB path: $path');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE health_records(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        steps INTEGER NOT NULL,
        calories INTEGER,
        water INTEGER NOT NULL,
        sleep REAL
      )
    ''');
    print('Database created and health_records table created');
  }

  // INSERT
  Future<int> insertRecord(HealthRecord record) async {
    final db = await database;
    final id = await db.insert('health_records', record.toMap());
    print('Inserted record with id: $id');
    return id;
  }

  // UPDATE
  Future<int> updateRecord(HealthRecord record) async {
    final db = await database;
    final rows = await db.update(
      'health_records',
      record.toMap(),
      where: 'id = ?',
      whereArgs: [record.id],
    );
    print('Updated rows: $rows for id: ${record.id}');
    return rows;
  }

  // DELETE
  Future<int> deleteRecord(int id) async {
    final db = await database;
    final rows = await db.delete(
      'health_records',
      where: 'id = ?',
      whereArgs: [id],
    );
    print('Deleted rows: $rows for id: $id');
    return rows;
  }

  // FETCH ALL RECORDS (as Map)
  Future<List<Map<String, dynamic>>> getAllRecords() async {
    final db = await database;
    return await db.query(
      'health_records',
      orderBy: 'date DESC',
    );
  }

  // FETCH ALL RECORDS (as HealthRecord objects)
  Future<List<HealthRecord>> getAllHealthRecords() async {
    final res = await getAllRecords();
    return res.map((e) => HealthRecord.fromMap(e)).toList();
  }

  // FETCH LATEST RECORD
  Future<HealthRecord?> getLatestRecord() async {
    final db = await database;
    final res = await db.query(
      'health_records',
      orderBy: 'date DESC',
      limit: 1,
    );
    if (res.isNotEmpty) return HealthRecord.fromMap(res.first);
    return null;
  }

  // FETCH BY ID
  Future<HealthRecord?> getRecordById(int id) async {
    final db = await database;
    final res = await db.query(
      'health_records',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (res.isNotEmpty) {
      print('Record found for ID: $id');
      return HealthRecord.fromMap(res.first);
    }
    print('No record found for ID: $id');
    return null;
  }
}
