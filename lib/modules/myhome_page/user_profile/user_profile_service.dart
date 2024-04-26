
import 'dart:convert';

import '../../../config/services_config.dart';
import 'package:http/http.dart' as http;

import '../../../models/user.dart';

class UserProfileService{

  var url = Uri.parse(ServerConfig.DomainNameServer+ServerConfig.getMyProduct);//get my products
  var message; //the message of unauth

  Future<List<dynamic>> fetchMyProductsService() async{
    var response = await http.get(url,
      headers: {
        'Accept':'application/json',
        'Authorization':'Bearer ${User.user_token}'
      },
    );

    print(response.statusCode);
    if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body);
      var responseProductsList = jsonResponse;
      return responseProductsList;
    }else{
      var jsonResponse = jsonDecode(response.body);
      var message = jsonResponse['message'];
      return [];
    }

  }






}