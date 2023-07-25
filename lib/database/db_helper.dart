import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import '../model/car.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  final String tableName = 'table_cars';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnDescription = 'description';
  final String columnPrice = 'price';
  final String columnYear = 'year';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'car.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$columnName TEXT,"
        "$columnDescription TEXT,"
        "$columnPrice TEXT,"
        "$columnYear TEXT)";
    await db.execute(sql);
  }

  Future<int?> saveCar(Car car) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, car.toMap());
  }

  Future<List?> getCars() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnName,
      columnDescription,
      columnPrice,
      columnYear
    ]);

    return result.toList();
  }

  Future<int?> updateCar(Car car) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, car.toMap(),
        where: '$columnId = ?', whereArgs: [car.id]);
  }

  Future<int?> deleteCar(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
