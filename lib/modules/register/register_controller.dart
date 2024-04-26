


import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/modules/register/register_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  var username = '';

  var email = '';
  var phoneNumber = '';

  var age ='';
  var password = '';
  var passwordconfirm = '';

  var signUpStatus = false; //  ٍيعبر عن نجاح عملية التسجيل او عدم النجاح
  var statusMsg; //يعبر عن رسالة نجاح التسجيل أو رسالة الخطأ


  RegisterService registerService = RegisterService();


  Future<void> registerUserController() async {
    User user = User(
        fullname: username,
        email: email,
        password: password,
        passwordconfirm: passwordconfirm,
        phoneNumber: phoneNumber,
        age: age
    );

    signUpStatus = await registerService.register(user);
    statusMsg = registerService.message;

    if(statusMsg is Map){
      String temp = ' ';
      if(statusMsg['name'] is List){
        temp += statusMsg['name'][0] + '\n';
      }
      if(statusMsg['email'] is List){
        temp += statusMsg['email'][0] + '\n';
      }
      if(statusMsg['password_confirmation'] is List){
        temp += statusMsg['password_confirmation'][0] + '\n';
      }
      if(statusMsg['phone_number'] is List){
        temp += statusMsg['phone_number'][0] + '\n';
      }
      if(statusMsg['age'] is List){
        temp += statusMsg['age'][0] + '\n';
      }
    statusMsg = temp;

    }

  }
}