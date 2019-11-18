import 'dart:async';
import 'dart:core';

import 'package:flutter_stocks_statistics/data/entity/account_info.dart';
import 'package:flutter_stocks_statistics/data/entity/trader_info.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String dataBaseName = "stocks_statistics.db";

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'sqflite.db');
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  //创建数据库表
  void _onCreate(Database db, int version) async {
    // accountInfo
    await db.execute('''
          CREATE TABLE $tableAccount (
            $columnId INTEGER PRIMARY KEY, 
            $columnName TEXT, 
            $columnTraderId INTEGER, 
            $columnAccount REAL, 
            $columnPassword TEXT)
          ''');

    print("Table is created");
  }

  //关闭
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
