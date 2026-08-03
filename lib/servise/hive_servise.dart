import 'package:hive_flutter/hive_flutter.dart';

class HiveService {

  static final Box  box = Hive.box("appBox");

   static Future<void> savelogintime ()async {

    await box.put('isLogin', true);

    await box.put('LoginTime', DateTime.now());

  }

  static bool isloged(){

    return box.get('isLogin',defaultValue: false);


  }

  static bool isSesionexpire() {

    final DateTime loginTime =  box.get('LoginTime');

    if (loginTime==null){
      return false;
    }

    return DateTime.now().difference(loginTime).inMinutes >= 1;

  }


  static Future<void> clearSession() async {
    await box.delete("isLogin");
    await box.delete("LoginTime");
  }

}