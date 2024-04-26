import 'dart:convert';

import 'package:e_commerce/config/services_config.dart';
import 'package:e_commerce/models/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchPageService{




Future<List<dynamic>> getResult(String searchedProduct )async{

  var url = Uri.parse(ServerConfig.DomainNameServer+ServerConfig.search+'?name=${searchedProduct}');
  var response = await http.get(url,
      headers: {
        'Accept':'application/json',
      }
  );

  if(response.statusCode==200){
    print('search ${response.statusCode}');
   var jsonResponse = jsonDecode(response.body);
   var resultList = jsonResponse['data'];
   return resultList;
  }else{
   return [];
  }



}





}