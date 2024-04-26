

import 'dart:convert';

import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/modules/add_product/add_product.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../../config/services_config.dart';

class NewProductService{

  var message;
  var addStatus; // either the product data as a map or the errors map

  var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.addProduct);

 Future<bool> addProductToDataBaseService(Product product)async{

   FormData formData = new FormData.fromMap({
     'name':product.productName,
     'price':product.productPrice.toString(),
     'description':product.productDescription,
     'image_url': await MultipartFile.fromFile(product.imageLink!.path , filename:'p'),
     'quantity':product.productQuantity.toString(),
     'category_id':(availableCategories.indexOf(product.productCategory)+1).toString(),
     'user_id':User.userId
   });
   
   Response response = await Dio().post(ServerConfig.DomainNameServer + ServerConfig.addProduct,
     data: formData,
     options:Options(
       headers: {
         'Accept':'application/json',
         'Authorization':'Bearer ${User.user_token}'
       }
     )
   );


   if(response.statusCode==200){

    message = response.data['message'];
    addStatus = response.data['data'];
     product.productId = response.data['data']['id'];

     print(response.statusCode);
     print(message);
     print(addStatus);
     return true;
   }else{

     message = response.data['message'];
     addStatus = response.data['error'];
     print(message);
     print(addStatus);
     print(response.statusCode);
     return false;
   }

 }


 /*
  var response = await http.post(url,
     headers: {
     'Accept':'application/json',
       'Authorization':'Bearer ${User.user_token}'
     },
     body: {
      'name':product.productName,
       'price':'20',
       'description':product.productDescription,
       'image_url':product.imageLink, // type file
       'quantity':'2',
       'category_id':'2',
     }
   );
  */}

  /*
     var image = http.MultipartFile.fromBytes('image_url',(await rootBundle.load(product.imageLink.path)).buffer.asUint8List());

    request.files.add(image);

    var response = await request.send();

   */


/*

  var stream = new http.ByteStream(product.imageLink!.openRead());
   stream.cast();

   var length = await stream.length;

   var request = new  http.MultipartRequest('POST',url);

   request.headers['Accept'] ='application/json';
   request.headers['Authorization']='Bearer ${User.user_token}';

   request.fields['name']=product.productName;
   request.fields['price']='20';
   request.fields['description']=product.productDescription;
   request.fields['quantity']='2';
   request.fields['category_id']='1';


   var multipart = new http.MultipartFile('image_url',stream,length);

   request.files.add(multipart);

   var response = await request.send();

   print(product.imageLink!.path);
   print(response.statusCode);

 */