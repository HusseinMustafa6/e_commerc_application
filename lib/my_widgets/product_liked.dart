
import 'package:e_commerce/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../config/services_config.dart';
import '../modules/myhome_page/favorite_page/my_favorite.dart';

class LikedProductTile extends StatelessWidget {

  final Product product;
  LikedProductTile(this.product);

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
              child:product.imageLink!= null
                  ? Image.file(product.imageLink!,fit: BoxFit.cover,)
                  : Image.network(ServerConfig.DomainNameServer+'/storage/product_images/${product.productImageName}',fit: BoxFit.cover,),
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
                          child: Obx(() => CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              splashRadius: 30,
                              icon: product.isFavorite.value
                                  ? Icon(Icons.favorite_rounded)
                                  : Icon(Icons.favorite_border),
                              onPressed: () async {
                                product.isFavorite.toggle();
                                if(product.isFavorite.isTrue){
                                  //myFavoriteController.likedProducts.add(product);
                                }else{
                                  bool deleteStatus =await myFavoriteController.myFavoriteService.deleteProductFromWishList(product);
                                  if(deleteStatus) {
                                    int index = myFavoriteController
                                        .likedProducts.indexOf(product);
                                    myFavoriteController.likedProducts.removeAt(
                                        index);
                                  }else{
                                    int index = myFavoriteController
                                        .likedProducts.indexOf(product);
                                    myFavoriteController.likedProducts.removeAt(
                                        index);
                                  }
                                }
                              },
                            ),
                          )),
                        ),
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
