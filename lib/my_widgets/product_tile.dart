import 'dart:ui';

import 'package:e_commerce/modules/myhome_page/cart_page/shopping_cart.dart';
import 'package:e_commerce/modules/myhome_page/favorite_page/my_favorite.dart';
import 'package:e_commerce/modules/product_info/product_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../config/services_config.dart';
import '../models/product.dart';
import '../models/user.dart';
import '../modules/myhome_page/products_home/products_home.dart';
import '../modules/myhome_page/user_profile/user_profile.dart';
import 'package:http/http.dart' as http;

int someConst =1;

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        someConst = product.ownerOfProductID;
        productInfoController.onCall();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductInfo(product);
        }));
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: product.imageLink != null
                        ? Image.file(
                            product.imageLink!,
                            fit: BoxFit.cover,
                          )
                        : Image.network(ServerConfig.DomainNameServer +
                            '/storage/product_images/${product.productImageName}',fit: BoxFit.cover,),
                  ),
                  Positioned(
                    top: -12,
                    left: -10,
                    child: Obx(() => Container(
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            color: Colors.blue[700],
                            splashRadius: 30,
                            icon: product.isFavorite.value
                                ? Icon(Icons.favorite_rounded)
                                : Icon(Icons.favorite_border),
                            onPressed: ()async{
                              product.isFavorite.toggle();

                              if( product.isFavorite.isTrue ) {
                                bool requestAddStatus = await myFavoriteController.myFavoriteService.addProductToWishList(product);
                                if (requestAddStatus &&
                                    productsHomeController.homeMainProducts
                                        .contains(product)) {
                                  myFavoriteController.likedProducts.add(
                                      product);
                                }
                              }

                              if(product.isFavorite.isFalse) {
                                bool requestDeleteStatus = await myFavoriteController.myFavoriteService.deleteProductFromWishList(product);
                                if (requestDeleteStatus &&
                                    productsHomeController.homeMainProducts
                                        .contains(product)) {
                                  int index = myFavoriteController.likedProducts
                                      .indexOf(product);
                                  myFavoriteController.likedProducts
                                      .removeAt(index);
                                }
                              }
                            },
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(height: 8),
              Text(
                product.productName,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Text(
                product.productDescription,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Text(
                product.productCategory.toString(),
                maxLines: 2,
                style:
                    TextStyle(fontWeight: FontWeight.w800, color: Colors.green),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('\$${product.productPrice}',
                        style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
                  ),
                  Expanded(
                      child:product.isAdminProduct? FlatButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        onPressed: () async {
                          var url = Uri.parse(ServerConfig.DomainNameServer+ServerConfig.sendMoneyToAdmin+'?product_id=${product.productId}&send=${product.productPrice}');
                           EasyLoading.show(status:'Loading...',dismissOnTap: true);
                           if(User.userId==1){
                             EasyLoading.showError('You Can\'t Buy one of your Products ',duration: Duration(seconds: 3));
                           }else{
                             var response = await http.post(url,headers: {
                               'Accept':'application/json',
                               'Authorization':'Bearer ${User.user_token}'
                             });

                             if(response.statusCode==200){
                               EasyLoading.showSuccess('Thank you for your purchase. ',duration: Duration(seconds: 3));
                               userProfileController.fetchUserBalance();
                               print('send to admin');
                               print(response.statusCode);
                               if(product.productQuantity==1){
                                 int index = productsHomeController.homeMainProducts.indexOf(product);
                                 productsHomeController.homeMainProducts.removeAt(index);
                               }else{
                                 product.productQuantity -= 1;
                               }
                             }else{
                               if(product.productPrice>userProfileController.balance.value){
                                EasyLoading.showError(' not enough in your balance !',duration: Duration(seconds: 3));
                               }else {
                                 EasyLoading.showSuccess(
                                     'Thank you for your purchase. ',
                                     duration: Duration(seconds: 3));
                                 userProfileController.fetchUserBalance();
                               }
                             }
                             
                           }
                        },
                        child: Text('Buy',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white),) ,
                      ):FlatButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                    onPressed: () async{
                      var url = Uri.parse(ServerConfig.DomainNameServer + ServerConfig.addToCart+'/${product.productId}');
                      EasyLoading.show(status: 'Loading...',dismissOnTap: true);
                      var response = await http.post(url,
                      headers: {
                        'Accept':'application/json',
                        'Authorization':'Bearer ${User.user_token}'
                      },
                       body: {
                        'cartKey':shoppingCartController.cartKey,
                        'quantity':'1'
                       }
                      );

                      if(response.statusCode==200) {
                        shoppingCartController.checkCartList(product);
                        print('add to cart done');

                      }else{
                        print('error while adding to the cart');
                        print(response.statusCode);
                      }


                    },
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
  Expanded(
                  child: Obx(() => CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      splashRadius: 30,
                      icon: product.isFavorite.value
                          ? Icon(Icons.favorite_rounded)
                          : Icon(Icons.favorite_border),
                      onPressed: () {
                        product.isFavorite.toggle();
                        if(product.isFavorite.isTrue){
                          myFavoriteController.likedProducts.add(product);
                        }else{
                          int index =  myFavoriteController.likedProducts.indexOf(product);
                          myFavoriteController.likedProducts.removeAt(index);
                        }
                      },
                    ),
                  )),
                ),
*/

/*
 Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:  EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
 */

//   if (shoppingCartController.products.contains(product)) {
//
//                       } else {
//                         shoppingCartController.products.add(product);
//                         EasyLoading.showSuccess('Product added to the cart', duration: Duration(seconds: 2));
//                       }