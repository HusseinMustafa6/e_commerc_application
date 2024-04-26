
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/modules/myhome_page/cart_page/shopping_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../config/services_config.dart';
import '../modules/myhome_page/favorite_page/my_favorite.dart';

class CartProductTile extends StatelessWidget {

  final Product product;
  CartProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Container(
              padding: EdgeInsets.symmetric(horizontal:5),
              height:180,
              width: 125,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: product.imageLink!= null
                  ? Image.file(product.imageLink!,fit: BoxFit.cover,)
                  : Image.network(ServerConfig.DomainNameServer+'/storage/product_images/${product.productImageName}'),
            ),
              SizedBox(width: 8,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      maxLines: 2,
                      style:
                      TextStyle(fontWeight: FontWeight.w800,fontSize: 22),
                      textAlign: TextAlign.left,

                    ),
                    SizedBox(height: 10),
                    Text(
                      product.productDescription,
                      maxLines: 4,
                      textAlign: TextAlign.left,
                      style:
                      TextStyle(fontWeight: FontWeight.w400,fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Text(
                      product.productCategory.toString(),
                      maxLines: 2,
                      style:
                      TextStyle(fontWeight: FontWeight.w800 ,color: Colors.green),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text('\$${product.productPrice}',
                              style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
                        ),
                        Expanded(
                            child:IconButton(icon: Icon(Icons.delete ,color: Colors.blue,),
                            onPressed: (){
                              Future.delayed(Duration(seconds: 2));
                              shoppingCartController.products.remove(product);
                            },))
                      ],
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
