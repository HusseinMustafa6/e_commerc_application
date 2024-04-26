import 'dart:convert';

import 'package:e_commerce/config/services_config.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/modules/myhome_page/user_profile/user_profile.dart';
import 'package:e_commerce/modules/myhome_page/user_profile/user_profile_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../models/user.dart';
import '../products_home/products_home.dart';

class UserProfileController extends GetxController {

  String fullName = '';
  String email = '';
  String phone = '';
  var userImage;
  var balance =0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchMyProducts();
    fetchUserBalance();
  }


  var isLoading = true.obs;
  List<Product> userProducts = <Product>[].obs; //list of offering products by user

  UserProfileService userProfileService = UserProfileService();

  fetchMyProducts() async {
    isLoading(true);
    var responseProductsList = await userProfileService.fetchMyProductsService();

    if (responseProductsList.isNotEmpty) {
      for (int i = 0; i < responseProductsList.length; i++) {
        int temp = responseProductsList[i]['user_id'];

        Product product = Product(productName: responseProductsList[i]['name'],
            productDescription: responseProductsList[i]['description'],
            productPrice: responseProductsList[i]['price'],
            productCategory:availableCategories[responseProductsList[i]['category_id']-1],
            imageLink: null,
            productQuantity: responseProductsList[i]['quantity'],
            isAdminProduct: temp==1?true:false,
             );

           product.productId =  responseProductsList[i]['id'];
           product.productImageName= responseProductsList[i]['image_url'];//the image name

           product.ownerOfProductID = responseProductsList[i]['user_id'];

           print('owner ID =product.ownerOfProductID');

           if( product.ownerOfProductID==1){
             product.isAdminProduct == true;
           }else{
             product.isAdminProduct == false;
           }
         userProducts.add(product);
      }
    }else{
      EasyLoading.showError('Error While fetching the data !',duration: Duration(seconds: 4));
    }
    isLoading(false);
  }

  fetchUserBalance()async{
    var url = Uri.parse(ServerConfig.DomainNameServer+ServerConfig.seeBalance);
    var response = await http.get(url,headers: {
      'Accept':'application/json',
      'Authorization':'Bearer ${User.user_token}'
    });
    if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body);
      balance.value = jsonResponse['balance'];
    }else{

    }

  }

}