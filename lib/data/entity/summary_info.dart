import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:flutter_stocks_statistics/util/database_helper.dart';

//final String tableSummary = "table_summary";
//final String columnSummaryUserId =
//    "summary_user_object_id"; // 该summary对应的userId
//final String columnSumAccountId =
//    "summary_account_object_id"; // 该summary对应的accountId
//final String columnSumStockId = "stock_object_id";
//final String columnSubscribeCount = "subcribe_count"; // 申购数量
//final String columnWinningCount = "winning_count"; // 中签数量
//final String columnHoldCount = "hold_count"; // 持仓数量
//final String columnSoldOutCount = "sold_out_count"; // 卖出数量
//final String columnSoldOutTotal = "sold_out_total"; // 卖出总价格
//final String columnWinningTotal = "winning_total"; // 成本价，包括手续费等
//final String columnGainTotal = "gain_total"; // 当前盈利

class SummaryInfo extends BmobObject {
  String sumUserId;
  String sumAccountId;
  String sumStockId;
  int subscribeCount;
  int winningCount;
  int holdCount;
  int soldOutCount;
  int soldOutTotal;
  int winningTotal; // 成本价
  int gainTotal; // 盈利

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnSummaryUserId: sumUserId,
      columnSumAccountId: sumAccountId,
      columnSumStockId: sumStockId,
      columnSubscribeCount: subscribeCount,
      columnWinningCount: winningCount,
      columnHoldCount: holdCount,
      columnSoldOutCount: soldOutCount,
      columnSoldOutTotal: soldOutTotal,
      columnWinningTotal: winningTotal,
      columnGainTotal: gainTotal,
    };
    return map;
  }

  SummaryInfo();

  SummaryInfo.fromMap(Map<String, dynamic> map) {
    sumUserId = map[columnSummaryUserId];
    sumAccountId = map[columnSumAccountId];
    sumStockId = map[columnSumStockId];
    subscribeCount = map[columnSubscribeCount];
    winningCount = map[columnWinningCount];
    holdCount = map[columnHoldCount];
    soldOutCount = map[columnSoldOutCount];
    soldOutTotal = map[columnSoldOutTotal];
    winningTotal = map[columnWinningTotal];
    gainTotal = map[columnGainTotal];
  }

  @override
  Map getParams() {
    // TODO: implement getParams
    return toMap();
  }
}
