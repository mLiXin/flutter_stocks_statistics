import 'dart:async';
import 'dart:core';

import 'package:flutter_stocks_statistics/util/log_helper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String dataBaseName = "stocks_statistics.db";

// user
final String tableUser = "table_user";
final String columnUserId = "user_id";
final String columnUserName = "user_name";
final String columnUserMobile = "user_mobile";
final String columnUserPassword = "user_password";

// account
final String tableAccount = "table_account";
final String columnAccountUserId = "account_user_id"; // 该账户对应的userId
final String columnAccountTraderId = "account_trader_id"; // 该账户对应的traderId
final String columnAccountName = "name";
final String columnAccount = "account";
final String columnPassword = "password";

// trader
final String tableTrader = "table_trader";
final String columnTraderUserId = "trader_user_id"; //该券商对应的userId
final String columnTraderName = "name";
final String columnFinancingFee = "financing_fee"; // 融资手续费
final String columnWinningFee = "winning_fee"; // 中签手续费
final String columnSubscribeFee = "subscribe_fee"; // 申购手续费
final String columnTradingFee = "trading_fee"; // 交易手续费
final String columnTradingRate = "trading_rate"; // 交易手续费率
final String columnOtherFee = "other_fee"; // 备用字段

// summary
final String tableSummary = "table_summary";
final String columnSummaryUserId = "summary_user_id"; // 该summary对应的userId
final String columnSumAccountId = "summary_account_id"; // 该summary对应的accountId
final String columnSumStockId = "stock_object_id";
final String columnSubscribeCount = "subcribe_count"; // 申购数量
final String columnWinningCount = "winning_count"; // 中签数量
final String columnHoldCount = "hold_count"; // 持仓数量
final String columnSoldOutCount = "sold_out_count"; // 卖出数量
final String columnSoldOutTotal = "sold_out_total"; // 卖出总价格
final String columnWinningTotal = "winning_total"; // 成本价，包括手续费等
final String columnGainTotal = "gain_total"; // 当前盈利

// stock
final String tableStock = "table_stock";
final String columnStockUserId = "stock_user_id";
final String columnStockCode = "stock_code";
final String columnStockName = "stock_name";
final String columnStockPrice = "stock_price"; // 定价
final String columnStockBoardLotsCount = "stock_board_lots_count"; // 一手股数

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
    // userInfo
    await db.execute('''
          CREATE TABLE $tableUser (
            $columnUserId TEXT, 
            $columnUserName TEXT, 
            $columnUserMobile TEXT, 
            $columnUserPassword TEXT)
          ''');
    LogHelper.e("Table Test is created");

    // accountInfo
    await db.execute('''
          CREATE TABLE $tableAccount (
            $columnAccountUserId TEXT, 
            $columnAccountTraderId TEXT,
            $columnAccountName TEXT, 
            $columnAccount TEXT, 
            $columnPassword TEXT)
          ''');
    LogHelper.e("Table $tableAccount is created");

    // tableTrader
    await db.execute('''
      CREATE TABLE $tableTrader (
            $columnTraderUserId TEXT, 
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
            $columnSummaryUserId TEXT, 
            $columnSumAccountId INTEGER,
            $columnSumStockId INTEGER,
            $columnSubscribeCount INTEGER,
            $columnWinningCount INTEGER,
            $columnHoldCount INTEGER,
            $columnSoldOutCount INTEGER,
            $columnSoldOutTotal INTEGER)
    ''');
    LogHelper.e("Table $tableSummary is created");

    // tableStock
    await db.execute('''
      CREATE TABLE $tableStock (
            $columnStockUserId TEXT,
            $columnStockCode TEXT,
            $columnStockName TEXT,
            $columnStockPrice INTEGER,
            $columnStockBoardLotsCount INTEGER)
    ''');
    LogHelper.e("Table $tableStock is created");
  }

  //关闭
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
