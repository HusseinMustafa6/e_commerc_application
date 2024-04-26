

import 'package:dio/dio.dart';
import 'package:e_commerce/config/services_config.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/modules/update_product/update_product.dart';
import 'package:e_commerce/modules/update_product/update_product_controller.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';




import '../../models/user.dart';

class UpdateProductService {



  Future<bool> UpdateProduct(Product product) async{
    print(product.imageLink?.path);

    FormData formData = new FormData.fromMap({
      'name':product.productName,
      'price':product.productPrice.toString(),
      'description':product.productDescription,
      'image_url':updateProductController.imageLink !=null? await MultipartFile.fromFile(product.imageLink!.path , filename:product.productImageName):product.productImageName,
      'quantity':product.productQuantity.toString(),
      'category_id':'1',
      'user_id':User.userId
    });

    Response response = await Dio().post(ServerConfig.DomainNameServer+ServerConfig.updateProduct+'/${product.productId}'+'?_method=PUT',
    data: formData,
      options:Options(
    headers: {
        'Accept':'application/json',
        'Authorization':'Bearer ${User.user_token}'
        }
      ));


    if(response.statusCode==200 &&(updateProductController.productName != null ||
        updateProductController.productDescription !=null ||
        updateProductController.productPrice !=null ||
        updateProductController.productCategory !=null ||
        updateProductController.productQuantity !=null ||
        updateProductController.imageLink !=null)){

      updateProductController.productName = null;
          updateProductController.productDescription =null;
          updateProductController.productPrice =null;
          updateProductController.productCategory =null;
          updateProductController.productQuantity =null;
          updateProductController.imageLink =null;

      print(response.statusCode);
    return true;
    }else {
      EasyLoading.showError('one field at least must be updated !',duration:Duration(seconds: 4));
      print(response.statusCode);
      return false;
    }

  }


}