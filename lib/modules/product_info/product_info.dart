



import 'dart:convert';

import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/modules/product_info/product_info_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../config/services_config.dart';
import 'package:http/http.dart' as http;

import '../../models/user.dart';
import '../myhome_page/cart_page/shopping_cart.dart';
import '../myhome_page/products_home/products_home.dart';
import '../myhome_page/user_profile/user_profile.dart';


ProductInfoController productInfoController = Get.put(ProductInfoController());

class ProductInfo extends StatelessWidget {

  final Product product;
  ProductInfo(this.product);
   



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                clipBehavior: Clip.antiAlias,
                child: product.imageLink != null
                    ? Image.file(
                  product.imageLink!,
                  fit: BoxFit.cover,
                )
                    : Image.network(ServerConfig.DomainNameServer +
                    '/storage/product_images/${product.productImageName}'),
              ),
              SizedBox(height: 10,),
              Text(
                product.productName,
                maxLines: 2,
                style:
                TextStyle(fontWeight: FontWeight.w800 ,fontSize: 25),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10,),
              Text(
                'Quantity  ${product.productQuantity}',
                maxLines: 2,
                style:
                TextStyle(fontWeight: FontWeight.w500 ,fontSize: 25),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10,),
              Obx((){
                return Text(
                  'Contact ${productInfoController.ownerContact.value.toString()}',
                  maxLines: 2,
                  style:
                  TextStyle(fontWeight: FontWeight.w500 ,fontSize: 25),
                  textAlign: TextAlign.left,
                );}
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Text(
                  product.productDescription,
                  maxLines: 5,
                  style:
                  TextStyle(fontWeight: FontWeight.w400,fontSize: 20),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: Text('\$${product.productPrice}',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),)),
                  Expanded(child:product.isAdminProduct? RaisedButton(
                    onPressed:() async {
                      var url = Uri.parse(ServerConfig.DomainNameServer+ServerConfig.sendMoneyToAdmin+'?send=${product.productPrice}');
                      EasyLoading.show(status:'Loading...',dismissOnTap: true);
                      if(User.userId==1){
                        EasyLoading.showError('You Can\'t Buy one of your Products ',duration: Duration(seconds: 3));
                      }else{
                        var response = await http.post(url,headers: {
                          'Accept':'application/json',
                          'Authorization':'Bearer ${User.user_token}'
                        });

                        if(response.statusCode==200){
                          EasyLoading.showSuccess('Thank you for your purshce ',duration: Duration(seconds: 3));
                          userProfileController.fetchUserBalance();
                          if(product.productQuantity==1){
                            int index = productsHomeController.homeMainProducts.indexOf(product);
                            productsHomeController.homeMainProducts.removeAt(index);
                          }else{
                            product.productQuantity -= 1;
                          }
                        }else{
                          EasyLoading.showError('Error',duration: Duration(seconds: 3));
                        }

                      }
                    },
                    child: Text('Buy',style: TextStyle(fontSize: 16,color: Colors.white),),
                    color: Colors.green,
                  ):RaisedButton(
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
                    child: Text('add to cart',style: TextStyle(fontSize: 16,color: Colors.white),),
                    color: Colors.blue,
                  ))
                ],
              )

            ],
          ),
        ),
      ),

    );
  }
}
