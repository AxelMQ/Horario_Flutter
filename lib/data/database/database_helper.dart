import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = 'horario.db';
  static final _databaseVersion = 2;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE materias(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      materia TEXT,
      sigla TEXT,
      grupo TEXT,
      docente TEXT,
      semestre TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS horarios(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      dia TEXT,
      horaInicio TEXT,
      horaFinal TEXT,
      aula TEXT,
      materiaId INTEGER,
      FOREIGN KEY (materiaId) REFERENCES materias(id) ON DELETE CASCADE
    )
      ''');
  }

  Future<List<Map<String, dynamic>>> getMaterias() async {
    final db = await database;
    return db.query('materias');
  }

  Future<List<Map<String, dynamic>>> getHorarios() async {
    final db = await database;
    return db.query('horarios');
  }

  Future<List<Map<String, dynamic>>> getHorarioMateria(int materiaId) async {
    final db = await database;
    return db.query(
      'horarios',
      where: 'materiaId = ?',
      whereArgs: [materiaId],
      );
  }

  Future<void> deleteMateria(int id) async {
    final db = await database;
    await db.delete(
      'materias',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteHorario(int id) async {
    final db = await database;
    await db.delete(
      'horarios',
      where: 'id = ?',
      whereArgs: [id],
    );
  }


}
