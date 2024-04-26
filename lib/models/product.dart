


 /*
  enum availableCategories{
 Laptops,
 Games,
 Wearings,
 Refrigerator,
 Phones,
 Televisions,
 Accessory,
 Hardware,
 Earphones,
 Washers,
 Consoles,
 Watches,
 Taplets,
 Makeup


 }
  */
 import 'dart:io';

import 'package:e_commerce/modules/myhome_page/user_profile/user_profile.dart';
import 'package:get/get.dart';

List <String?> availableCategories = <String>[
 'Laptops',
 'Games',
 'Wearings',
 'Refrigerator',
 'Phones',
 'Televisions',
 'Accessory',
 'Hardware',
 'Earphones',
 'Washers',
 'Consoles',
 'Watches',
 'Taplets',
 'Books'
];




class Product {

  Product({
  required this.productName,
  required this.productDescription,
  required this.productPrice,
  required this.productCategory,
    required this.imageLink,
    required this.productQuantity,
    required this.isAdminProduct
  });

  late int productId;
  late int ownerOfProductID;
  String productImageName='';
  var productName;
  var productDescription;
  var productPrice;
  String? productCategory ;
  File? imageLink;
  var productQuantity;



  var isFavorite = false.obs;
   bool isAdminProduct ;

}