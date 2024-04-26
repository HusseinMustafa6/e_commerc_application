

import 'package:e_commerce/config/services_config.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/modules/search/search_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchPageContrller extends GetxController{

 var isLoading = true.obs;
 List<Product> result = <Product>[].obs;
 String searchedProduct='';


  SearchPageService searchPageService = SearchPageService();
  
  showOnClick()async{
   isLoading(true);
   var responseProductsList = await searchPageService.getResult(searchedProduct);

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
     result.add(product);
    }
   }else{
    EasyLoading.showError('Error While fetching the data !',duration: Duration(seconds: 4));
   }
   isLoading(false);
   

  }


}