import 'package:flutter_stocks_statistics/util/database_helper.dart';

// 账号信息
class AccountInfo {
  int id;
  String name;
  int traderId;
  String account;
  String password;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnAccountName: name,
      columnAccountTraderId: traderId,
      columnAccount: account,
      columnPassword: password,
    };
    if (id != null) {
      map[columnAccountId] = id;
    }
    return map;
  }

  AccountInfo();

  AccountInfo.fromMap(Map<String, dynamic> map) {
    id = map[columnAccountId];
    name = map[columnAccountName];
    traderId = map[columnTraderId];
    account = map[columnAccount];
    password = map[columnPassword];
  }
}
