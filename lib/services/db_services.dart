import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

import '../models/student.dart';

class DBService {
  // open the database located in the internal storage
  static Future<Database> _database() async {
    final dbPath = await sql.getDatabasesPath();

    final database = await sql.openDatabase(
      path.join(dbPath, 'students.db'),
      version: 1,
      onCreate: (db, version) async {
        db.execute(
          'CREATE TABLE students ('
          'id TEXT PRIMARY KEY,'
          'full_name TEXT,'
          'christian_name TEXT,'
          'department TEXT,'
          'sex TEXT,'
          'phone TEXT,'
          'batch INTEGER,'
          'time TEXT'
          ')',
        );
      },
    );

    // return the opened database
    return database;
  }

  // to add student to internal storage
  static Future<void> addStudent(Student student) async {
    final db = await _database();

    final time = DateTime.now();

    db.execute(
      'INSERT INTO students VALUES ('
      "'${student.id}',"
      "'${student.fullName}',"
      "'${student.christianName}',"
      "'${student.department}',"
      "'${student.sex}',"
      "'${student.phone}',"
      "'${student.batch}',"
      "'${time.toIso8601String()}')",
    );
  }

  // to get all the student data available in internal storage
  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await _database();

    final data = await db.query('students');

    return data;
  }
}
