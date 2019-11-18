final String tableTrader = "table_trader";
final String columnName = "name";
final String columnId = "_id";
final String columnFinancingFee = "financing_fee"; // 融资手续费
final String columnWinningFee = "winning_fee"; // 中签手续费
final String columnSubscribeFee = "subscribe_fee"; // 申购手续费
final String columnTradingFee = "trading_fee"; // 交易手续费
final String columnTradingRate = "trading_rate"; // 交易手续费率
final String columnOtherFee = "other_fee"; // 备用字段

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
      columnName: name,
      columnFinancingFee: financingFee,
      columnWinningFee: winningFee,
      columnSubscribeFee: subscriberFee,
      columnTradingFee: tradingFee,
      columnTradingRate: tradingRate,
      columnOtherFee: otherFee
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  TraderInfo();

  TraderInfo.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    financingFee = map[columnFinancingFee];
    winningFee = map[columnWinningFee];
    subscriberFee = map[columnSubscribeFee];
    tradingFee = map[columnTradingFee];
    tradingRate = map[tradingRate];
    otherFee = map[columnOtherFee];
  }
}
