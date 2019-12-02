import 'package:flutter_stocks_statistics/util/database_helper.dart';

//final String tableUser = "table_user";
//final String columnUserId = "user_id";
//final String columnUserName = "user_name";
//final String columnUserMobile = "user_mobile";
//final String columnUserPassword = "user_password";

class UserInfo {
  String userId;
  String userName;
  String userMobile;
  String userPassword;

  UserInfo(
    this.userMobile,
    this.userPassword, {
    this.userId,
    this.userName,
  });

  Map<String, dynamic> toMap() {
    /// todo userId自动生成
    if (userId == null) {
      userId = DateTime.now().toString();
    }

    if (userName == null) {
      userName = userMobile;
    }
    var map = <String, dynamic>{
      columnUserId: userId,
      columnUserName: userName,
      columnUserMobile: userMobile,
      columnUserPassword: userPassword
    };
    return map;
  }

  UserInfo.fromMap(Map<String, dynamic> map) {
    userId = map[columnUserId];
    userName = map[columnUserName];
    userMobile = map[columnUserMobile];
    userPassword = map[columnUserPassword];
  }
}
