

import 'dart:convert';

import 'package:e_commerce/config/services_config.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/modules/myhome_page/cart_page/shopping_cart.dart';
import 'package:http/http.dart' as http;

import '../../../models/user.dart';
import 'my_favorite.dart';

class MyFavoriteService{


  var url = Uri.parse(ServerConfig.DomainNameServer+ServerConfig.getWishListItems);
  var url2 = Uri.parse(ServerConfig.DomainNameServer+ServerConfig.addToWishList);


  Future<bool> addProductToWishList(Product p)async{
    var response = await http.post(url2,
    headers: {
      'Accept':'application/json',
      'Authorization':'Bearer ${User.user_token}'
    },
      body: {
         'product_id':p.productId.toString(),
        'user_id':User.userId.toString()
      }
    );

   if(response.statusCode==200){
   print(response.statusCode);
     return true;
   }else{
     print(response.statusCode);
     return false;
   }

  }

  Future<bool> deleteProductFromWishList(Product p)async{
    int index = myFavoriteController.likedProducts.indexOf(p);
    var url3 = Uri.parse(ServerConfig.DomainNameServer+ServerConfig.deleteFromWishList+'/${myFavoriteController.itemsIndex[index]}');
    var response = await http.delete(url3,
      headers: {
        'Accept':'application/json',
        'Authorization':'Bearer ${User.user_token}'
      },
      body: {
      }
    );

    if(response.statusCode==200){
      print('delete from wish List');
      print(response.statusCode);
      return true;
    }else{
      print('delete is not done');
      print(response.statusCode);
      return false;
    }

  }

 Future<List<dynamic>>  fetchLikedProducts()async{
   var response = await http.get(url,
   headers: {
     'Accept':'application/json',
     'Authorization':'Bearer ${User.user_token}'
   }
   );

   if(response.statusCode==200){
     var jsonResponse = jsonDecode(response.body);
     var responseProductsList = jsonResponse;
     print('wishList');
     print(response.statusCode);
      return responseProductsList;
   }else{
     print('wishList');
     print(response.statusCode);
     return [];
   }

  }




}