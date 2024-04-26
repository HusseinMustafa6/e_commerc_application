


import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/modules/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  var email =' ';
  var password = ' ';

  var loginstatus =  false; //متحول يعبر عن نجاح تسجيل الدخول او لا

  var statusMsg;  //رسالة نجاح تسجيل الدخول أو لا

  LoginService loginService = LoginService();

  Future<void> loginUserController()async {
    User user = User(email: email, password: password);

    loginstatus = await loginService.login(user);
    statusMsg = loginService.message;

    if (statusMsg is Map) {
      String temp = ' ';
      if (statusMsg['email'] is List) {
        temp += statusMsg['email'][0] + '\n';
      }
      if (statusMsg['password'] is List) {
        temp += statusMsg['password'][0] + '\n';
      }
      statusMsg = temp;
    }
  }
}