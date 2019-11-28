import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:flutter_stocks_statistics/util/database_helper.dart';

//final String tableStock = "table_stock";
//final String columnStockUserId = "stock_user_object_id";
//final String columnStockCode = "stock_code";
//final String columnStockName = "stock_name";
//final String columnPrice = "stock_price"; // 定价
//final String columnBoardLotsCount = "stock_board_lots_count"; // 一手股数

class StockInfo extends BmobObject {
  String stockUserId;
  String stockCode;
  String stockName;
  int stockPrice;
  int boardLotsCount;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnStockUserId: stockUserId,
      columnStockCode: stockCode,
      columnStockName: stockName,
      columnStockPrice: stockPrice,
      columnStockBoardLotsCount: boardLotsCount,
    };
    return map;
  }

  StockInfo();

  StockInfo.fromMap(Map<String, dynamic> map) {
    stockUserId = map[columnStockUserId];
    stockCode = map[columnStockCode];
    stockName = map[columnStockName];
    stockPrice = map[columnStockPrice];
    boardLotsCount = map[columnStockBoardLotsCount];
  }

  @override
  Map getParams() {
    // TODO: implement getParams
    return toMap();
  }
}
