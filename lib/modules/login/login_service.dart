

import 'dart:convert';

import 'package:e_commerce/config/services_config.dart';
import 'package:e_commerce/modules/myhome_page/user_profile/user_profile.dart';
import 'package:http/http.dart' as http;

import '../../models/user.dart';
import 'login.dart';



class LoginService{


  var message; //رسالة نجاح تسجيل الدخول أو فشله
  var message2;  //لمعالجة حالة الايميل او الباسورد خطأ أو كلاهما خطأ
  var token; //متحول لتخزين التوكين الخاص بالحساب
  var userId;

  var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.login);




  Future<bool> login(User user)async{
   var response = await http.post(url,
     headers: {
        'Accept':'application/json'
     },
     body: {
       'email':user.email,
        'password': user.password

     },
   );

    if(response.statusCode==200){
       var jsonResponse = jsonDecode(response.body);
       message = jsonResponse['user']; //في حال نجاح تسجيل الدخول تخزن معلومات المستخدم كاملة ضمنةهذا المتغير على شكل ماب
       token = jsonResponse['access_token'];
       userId =jsonResponse['user']['id'];
       User.user_token = token;
       User.userId = userId;

       userProfileController.fullName=message['name'];
       userProfileController.email =message['email'];
       userProfileController.phone =message['phone_number'];
       userProfileController.userImage = message['profile_photo'];
       userProfileController.fetchUserBalance();
       print(token);
      return true;
    }else{
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['errors']; //تخزين اسباب الخطأ في تسجيل الدخول
      message2 = jsonResponse['message'];
      return false;
    }


  }




}