
import 'dart:convert';


import '../../config/services_config.dart';
import '../../models/user.dart';

import 'package:http/http.dart' as http;
class RegisterService{


  var message;   //متغير يعبر عن رسالة النجاح أو رسالة الخطأ أو عدة أخطاء
  var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.register); //رابط الأي بي أي الخاص بالتسجيل

 var client = http.Client();

 Future<bool> register(User user) async{
  var response2;
  var response = await client.post(url,
      headers: {
        'Accept': 'application/json'
      },
      body: {
        'name': user.fullname,
        'email': user.email,
        'password': user.password,
        'password_confirmation': user.passwordconfirm,
        'phone_number': user.phoneNumber,
        'age': user.age
      });
   try {


     print(response.statusCode);
   }
   catch(e){
     print(e);
   }

   var  jsonResponse = jsonDecode(response.body);
   //String jsonsDataString = jsonResponse.toString();
  if(response.statusCode==200){

    message = jsonResponse['user']; //return a map contain user_info
    print(message);
    //print(message['email']);
    return true;
  }else {
    message = jsonResponse['error']; //return a list of errors

    return false;
  }


 }



}