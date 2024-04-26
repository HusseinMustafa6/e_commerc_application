
import 'dart:convert';

import '../../../config/services_config.dart';
import 'package:http/http.dart' as http;

import '../../../models/user.dart';

class ProductsHomeService {


  var url = Uri.parse(ServerConfig.DomainNameServer+ServerConfig.getAllProducts);//get my products


  Future<List<dynamic>> fetchAllProductsService() async{
    var response = await http.get(url,
      headers: {

      },
    );

    print(response.statusCode);
    if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body);
      var responseProductsList = jsonResponse;
      return responseProductsList;
    }else{
      var jsonResponse = jsonDecode(response.body);
      return [];
    }

  }




}