

import 'dart:io';

import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/modules/update_product/update_product.dart';
import 'package:e_commerce/modules/update_product/update_product_service.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController{

  var productName;
  var productDescription;
  var productPrice ;
  String? productCategory ;
  var productQuantity;
  var imageLink;



  bool updateStatus = false;
  UpdateProductService updateProductService = UpdateProductService();


  Future<bool> updateProduct(Product product)async{
    updateStatus = await updateProductService.UpdateProduct(product);
    if(updateStatus){
      return true;
    }else{
      return false;
    }

  }


}