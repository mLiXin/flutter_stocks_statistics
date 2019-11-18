final String tableAccount = "table_account";
final String columnAccountId = "_id";
final String columnAccountName = "name";
final String columnTraderId = "traderId";
final String columnAccount = "account";
final String columnPassword = "password";

class AccountInfo {
  int id;
  String name;
  int traderId;
  String account;
  String password;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnAccountName: name,
      columnTraderId: traderId,
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
