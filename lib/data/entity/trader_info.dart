import 'package:flutter_stocks_statistics/util/database_helper.dart';

// 券商信息
class TraderInfo {
  int id;
  String name;
  int financingFee;
  int winningFee;
  int subscriberFee;
  int tradingFee;
  int tradingRate;
  int otherFee;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTraderName: name,
      columnFinancingFee: financingFee,
      columnWinningFee: winningFee,
      columnSubscribeFee: subscriberFee,
      columnTradingFee: tradingFee,
      columnTradingRate: tradingRate,
      columnOtherFee: otherFee
    };
    if (id != null) {
      map[columnTraderId] = id;
    }
    return map;
  }

  TraderInfo();

  TraderInfo.fromMap(Map<String, dynamic> map) {
    id = map[columnTraderId];
    name = map[columnTraderName];
    financingFee = map[columnFinancingFee];
    winningFee = map[columnWinningFee];
    subscriberFee = map[columnSubscribeFee];
    tradingFee = map[columnTradingFee];
    tradingRate = map[tradingRate];
    otherFee = map[columnOtherFee];
  }
}
