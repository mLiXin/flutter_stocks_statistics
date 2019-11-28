import 'package:flutter_stocks_statistics/data/bmob/trader_bmob.dart';
import 'package:flutter_stocks_statistics/data/entity/trader_info.dart';

class TraderApi {
  static Future<List<TraderInfo>> getTraderList() async {
    return TraderBmob.getTraderList();
  }

  static Future<bool> addTrader(TraderInfo traderInfo) async {
//    return TraderDB.addTrader(traderInfo);
    return TraderBmob.addTrader(traderInfo);
  }
}
