
import 'package:e_commerce/modules/myhome_page/favorite_page/my_favorite_controller.dart';
import 'package:e_commerce/modules/myhome_page/products_home/products_home.dart';
import 'package:e_commerce/my_widgets/product_liked.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

MyFavoriteController myFavoriteController = Get.put(MyFavoriteController());

class MyFavorite extends StatefulWidget {

  @override
  _MyFavoriteState createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {




  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Column(
                children:[
                  Expanded(
                    child: Obx(() {
                    if(myFavoriteController.isLoading.value || myFavoriteController.likedProducts.isEmpty){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }else{
                    return ListView.builder(
                        itemCount: myFavoriteController.likedProducts.length,
                        itemBuilder: (context, index) {
                          return LikedProductTile(
                              myFavoriteController.likedProducts[index]);
                        }

                    );
                }}),
                  ),
              ]),
            
        )  );
  }
}

