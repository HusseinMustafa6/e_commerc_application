

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/modules/myhome_page/products_home/products_home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../my_widgets/product_tile.dart';

ProductsHomeController productsHomeController = Get.put(ProductsHomeController());

class ProductsHome extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
           children: [
             CarouselSlider(
                 items: [
                  Image.asset('images/banner1.jpg',fit: BoxFit.cover,width: double.infinity,),
                   Image.asset('images/banner6.webp',fit: BoxFit.cover,width: double.infinity,),
                   Image.asset('images/banner3.jpg',fit: BoxFit.cover,width: double.infinity,),
                   Image.asset('images/banner4.webp',fit: BoxFit.cover,width: double.infinity,),
                   Image.asset('images/banner5.jpg',fit: BoxFit.cover,width: double.infinity,),
                   Image.asset('images/banner2.jpg',fit: BoxFit.fitWidth,width: double.infinity,),
                   Image.asset('images/Webpnet-resizeimage-1.png',fit: BoxFit.fitWidth,width: double.infinity,),
                   Image.asset('images/Webpnet-resizeimage-2.png',fit: BoxFit.fitWidth,width: double.infinity,),
                 ],
                 options: CarouselOptions(
                   height: 250.0,
                   initialPage: 0,
                   viewportFraction: 1.0,
                   enableInfiniteScroll: true,
                   autoPlay: true,
                   autoPlayInterval: Duration(seconds: 3),
                   autoPlayAnimationDuration: Duration(seconds: 1),
                   autoPlayCurve: Curves.fastOutSlowIn,
                   scrollDirection: Axis.horizontal
                 ),),
             SizedBox(height: 10,),
             Obx((){

               if(productsHomeController.isLoading.value){
                 return Center(
                   child: CircularProgressIndicator(),
                 );
               }else {
                 return AlignedGridView.count(crossAxisCount: 2,
                   itemCount: productsHomeController.homeMainProducts.length,
                   mainAxisSpacing: 16,
                   crossAxisSpacing: 16,
                   shrinkWrap: true,
                   physics: BouncingScrollPhysics(),
                   itemBuilder: (context, index) {


                     return ProductTile(
                         productsHomeController.homeMainProducts[index]);
                   },
                 );
               }


             }



             )




           ],
        ),
      ),
    );
  }
}

