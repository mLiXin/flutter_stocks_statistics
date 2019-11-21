import 'dart:async';
import 'dart:core';

import 'package:flutter_stocks_statistics/util/log_helper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String dataBaseName = "stocks_statistics.db";

// account
final String tableAccount = "table_account";
final String columnAccountId = "_id";
final String columnAccountName = "name";
final String columnAccountTraderId = "account_trader_id";
final String columnAccount = "account";
final String columnPassword = "password";

// trader
final String tableTrader = "table_trader";
final String columnTraderId = "_id";
final String columnTraderName = "name";
final String columnFinancingFee = "financing_fee"; // 融资手续费
final String columnWinningFee = "winning_fee"; // 中签手续费
final String columnSubscribeFee = "subscribe_fee"; // 申购手续费
final String columnTradingFee = "trading_fee"; // 交易手续费
final String columnTradingRate = "trading_rate"; // 交易手续费率
final String columnOtherFee = "other_fee"; // 备用字段

// summary
final String tableSummary = "table_summary";
final String columnSummaryId = "_id";
final String columnSumAccountId = "account_id";
final String columnSumStockId = "stock_id";
final String columnSubscribeCount = "subcribe_count"; // 申购数量
final String columnWinningCount = "winning_count"; // 中签数量
final String columnHoldCount = "hold_count"; // 卖出数量
final String columnSoldOutTotal = "sold_out_total"; // 卖出总价格

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
    String path = join(databasesPath, dataBaseName);
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  //创建数据库表
  void _onCreate(Database db, int version) async {
    //
    await db.execute(
        'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    LogHelper.e("Table Test is created");

    // accountInfo
    await db.execute('''
          CREATE TABLE $tableAccount (
            $columnAccountId INTEGER PRIMARY KEY, 
            $columnAccountName TEXT, 
            $columnAccountTraderId INTEGER, 
            $columnAccount TEXT, 
            $columnPassword TEXT)
          ''');
    LogHelper.e("Table $tableAccount is created");

    // tableTrader
    await db.execute('''
      CREATE TABLE $tableTrader (
            $columnTraderId INTEGER PRIMARY KEY, 
            $columnTraderName TEXT, 
            $columnFinancingFee INTEGER, 
            $columnWinningFee INTEGER,
            $columnSubscribeFee INTEGER,
            $columnTradingFee INTEGER,
            $columnTradingRate INTEGER,
            $columnOtherFee INTEGER)
    ''');
    LogHelper.e("Table $tableTrader is created");

    // tableSummary
    await db.execute('''
      CREATE TABLE $tableSummary (
            $columnSummaryId INTEGER PRIMARY KEY, 
            $columnSumAccountId INTEGER,
            $columnSumStockId INTEGER,
            $columnSubscribeCount INTEGER,
            $columnWinningCount INTEGER,
            $columnHoldCount INTEGER,
            $columnSoldOutTotal INTEGER)
    ''');
    LogHelper.e("Table $tableSummary is created");
  }

  //关闭
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
