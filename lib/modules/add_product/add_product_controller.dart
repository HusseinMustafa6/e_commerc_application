
import 'dart:io';

import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/modules/add_product/add_product_service.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController{

  var productName;
  var productDescription;
  var productPrice ;
  String? productCategory ;
  var productQuantity ;
  File? imageLink;

  var message;
  var addStauts;
  bool adding = false; // variable refers to the api requset status

  NewProductService newProductService = NewProductService();

  Future<void> addProductToDataBaseController(Product product)async {

    adding = await newProductService.addProductToDataBaseService(product);
    message = newProductService.message;
    addStauts = newProductService.addStatus;

  }




}