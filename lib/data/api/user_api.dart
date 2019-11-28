import 'package:data_plugin/bmob/bmob_sms.dart';
import 'package:data_plugin/bmob/response/bmob_handled.dart';
import 'package:data_plugin/bmob/response/bmob_registered.dart';
import 'package:data_plugin/bmob/response/bmob_sent.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';

class UserApi{
  static Future<BmobSent> sendSms(String mobile){
    BmobSms sms = BmobSms();
    sms.mobilePhoneNumber = mobile;
    return sms.sendSms();
  }

  static Future<BmobHandled> verifySms(String mobile,String sms){
    BmobSms bmobSms = BmobSms();
    bmobSms.mobilePhoneNumber = mobile;
    return bmobSms.verifySmsCode(sms);
  }

  static Future<BmobRegistered> register(String mobile,String password){
    BmobUser user = BmobUser();
    user.mobilePhoneNumber = mobile;
    user.password = password;
    return user.register();
  }
}