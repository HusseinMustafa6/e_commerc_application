

import 'package:e_commerce/modules/myhome_page/cart_page/cart_controller.dart';
import 'package:e_commerce/my_widgets/cart_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

ShoppingCartController shoppingCartController = Get.put(ShoppingCartController());

class ShoppingCart extends StatelessWidget {


  void CartIsFinished(BuildContext context) {
    shoppingCartController.products.value = [];

    Alert(
      context: context,
      type: AlertType.success,
      title: "Success!",
      desc: "Thank's for purchasing from our app. \n Total Price = ${shoppingCartController.getTotalPrice()}. ",
      buttons: [

      ],
    ).show();
   shoppingCartController.totalPrice.value = 0.0;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Obx(() {
                  print(shoppingCartController.getTotalPrice().toString());
                  if(shoppingCartController.products.isEmpty){
                    return Text('');
                  }else{
                    return ListView.builder(
                        itemCount: shoppingCartController.products.length,
                        itemBuilder: (context, index) {
                          return CartProductTile(
                              shoppingCartController.products[index]
                          );
                        }

                    );
                  }}),
              ),
                  Expanded(
                    child: Obx((){
                      return Card(
                        elevation: 2,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child: Text('Total Ammount : ${shoppingCartController.products.length}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
                              Expanded(
                              child: FlatButton(

                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(80)),
                              child: Text('Check Out',style: TextStyle(fontSize: 20,color: Colors.white),),
                                onPressed: (){
                                if(shoppingCartController.products.isEmpty){
                                 EasyLoading.showError('There are no products in the cart !',duration: Duration(seconds: 3));
                                }else {
                                  CartIsFinished(context);
                                }
                                },
                              ))
                            ],
                          ),
                        ),
                      );

                    }),
                  ),


            ],
          ),
        ));
  }
}
