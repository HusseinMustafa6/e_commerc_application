
import 'dart:convert';

import 'package:e_commerce/modules/product_info/product_info.dart';
import 'package:get/get.dart';

import '../../config/services_config.dart';
import 'package:http/http.dart' as http;

import '../../models/product.dart';
import '../../my_widgets/product_tile.dart';

class ProductInfoController extends GetxController{

  var ownerContact = ''.obs;
  var productOwner ;


  onCall()async{
    productOwner = someConst;
    productInfoController.ownerContact.value = await productInfoController.getProductOwner();

  }

 //${product.ownerOfProductID}

  Future<dynamic> getProductOwner()async{

    var url = Uri.parse(ServerConfig.DomainNameServer+ServerConfig.getSomeUsers+'/$productOwner');

    var response = await http.get(url,headers: {});

    if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body);
      var phone = jsonResponse['phone_number'];
      print('get some users');
      print(response.statusCode);
      return phone;
    }else{
      return '';
    }

  }

}