import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:flutter_stocks_statistics/util/database_helper.dart';

//final String tableAccount = "table_account";
//final String columnAccountUserId = "account_user_object_id"; // 该账户对应的userId
//final String columnAccountTraderId = "account_trader_object_id"; // 该账户对应的traderId
//final String columnAccountName = "name";
//final String columnAccount = "account";
//final String columnPassword = "password";
// 账号信息
class AccountInfo extends BmobObject {
  String userObjectId;
  String traderObjectId;
  String name;
  String account;
  String password;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnAccountUserId: userObjectId,
      columnAccountTraderId: traderObjectId,
      columnAccountName: name,
      columnAccount: account,
      columnPassword: password,
    };
    return map;
  }

  AccountInfo();

  AccountInfo.fromMap(Map<String, dynamic> map) {
    userObjectId = map[columnAccountUserId];
    traderObjectId = map[columnAccountTraderId];
    name = map[columnAccountName];
    account = map[columnAccount];
    password = map[columnPassword];
  }

  @override
  Map getParams() {
    // TODO: implement getParams
    return toMap();
  }
}
