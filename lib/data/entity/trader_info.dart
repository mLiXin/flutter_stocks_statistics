import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:flutter_stocks_statistics/util/database_helper.dart';

//final String tableTrader = "table_trader";
//final String columnTraderUserId = "trader_user_object_id"; //该券商对应的userId
//final String columnTraderName = "name";
//final String columnFinancingFee = "financing_fee"; // 融资手续费
//final String columnWinningFee = "winning_fee"; // 中签手续费
//final String columnSubscribeFee = "subscribe_fee"; // 申购手续费
//final String columnTradingFee = "trading_fee"; // 交易手续费
//final String columnTradingRate = "trading_rate"; // 交易手续费率
//final String columnOtherFee = "other_fee"; // 备用字段

// 券商信息
class TraderInfo extends BmobObject {
  String userObjectId;
  String name;
  int financingFee;
  int winningFee;
  int subscriberFee;
  int tradingFee;
  int tradingRate;
  int otherFee;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTraderUserId: userObjectId,
      columnTraderName: name,
      columnFinancingFee: financingFee,
      columnWinningFee: winningFee,
      columnSubscribeFee: subscriberFee,
      columnTradingFee: tradingFee,
      columnTradingRate: tradingRate,
      columnOtherFee: otherFee
    };
    return map;
  }

  TraderInfo();

  TraderInfo.fromMap(Map<String, dynamic> map) {
    userObjectId = map[columnTraderUserId];
    name = map[columnTraderName];
    financingFee = map[columnFinancingFee];
    winningFee = map[columnWinningFee];
    subscriberFee = map[columnSubscribeFee];
    tradingFee = map[columnTradingFee];
    tradingRate = map[tradingRate];
    otherFee = map[columnOtherFee];
  }

  @override
  Map getParams() {
    // TODO: implement getParams
    return toMap();
  }
}
