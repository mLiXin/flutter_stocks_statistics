import 'package:flutter_stocks_statistics/data/database/trader_info_helper.dart';
import 'package:flutter_stocks_statistics/data/entity/trader_info.dart';

class TraderApi {
  static Future<List<TraderInfo>> getTraderList() async{
    return TraderInfoHelper.getTraderInfoList();
  }

  static Future addTrader(TraderInfo traderInfo) async{
    TraderInfoHelper.addTrader(traderInfo);
  }
}