

import 'dart:convert';

import 'package:e_commerce/config/services_config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../models/product.dart';
import '../../../models/user.dart';
import '../user_profile/user_profile.dart';

class ShoppingCartController extends GetxController{

  var cartId;
  var cartKey;

  var totalPrice = 0.0.obs;
   //double totalAmmount = 0.obs;
  var products = <Product>[].obs;
  var url= Uri.parse(ServerConfig.DomainNameServer+ServerConfig.createCart);

  @override
  void onInit() {
    super.onInit();
    createCart();
  }

  double getTotalPrice(){

    for(int i=0;i<products.length;i++){
      totalPrice.value += products[i].productPrice;

    }
    return totalPrice.value;
  }

  createCart()async{
    var response = await http.post(url,
    headers: {
      'Accept':'application/json',
      'Authorization':'Bearer ${User.user_token}'
    }
    );

    if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body);
      cartId = jsonResponse['cartId'];
      cartKey = jsonResponse['cartKey'];
      print(cartId);
      print(cartKey);
    }else{

    }
    
  }

  checkCartList(Product product){
   if(products.isNotEmpty && userProfileController.userProducts.isNotEmpty){
     bool temp = true;
     for(int i =0 ; i<products.length;i++){
       if(products[i].productId == product.productId){
         EasyLoading.showError('This Product already exists in the cart', duration: Duration(seconds: 4));
         temp =false;
          break;
       }
     }
     for(int i =0 ; i<userProfileController.userProducts.length;i++) {
       if (userProfileController.userProducts[i].productId == product.productId) {
         EasyLoading.showError('You can\'t add one of your products to the cart ', duration: Duration(seconds: 4));
         temp = false;
         break;
       }
     }
    if(temp){
      EasyLoading.showSuccess('Product added to the cart', duration: Duration(seconds: 2));
      products.add(product);
    }else{

    }

   }

     if(products.isEmpty && userProfileController.userProducts.isNotEmpty){
       bool temp = true;
       for(int i =0 ; i<userProfileController.userProducts.length;i++) {
         if (userProfileController.userProducts[i].productId == product.productId) {
           temp = false;
           break;
         }
       }
       if(temp){
         EasyLoading.showSuccess('Product added to the cart', duration: Duration(seconds: 2));
         products.add(product);
       }else{
         EasyLoading.showError('You can\'t add one of your products to the cart ', duration: Duration(seconds: 4));
       }
     }

     if(products.isNotEmpty && userProfileController.userProducts.isEmpty) {
       EasyLoading.showSuccess('Product added to the cart', duration: Duration(seconds: 2));
       products.add(product);
     }

     if(products.isEmpty && userProfileController.userProducts.isEmpty){
       EasyLoading.showSuccess('Product added to the cart', duration: Duration(seconds: 2));
       products.add(product);
     }

  }

}