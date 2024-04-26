import 'package:e_commerce/config/services_config.dart';
import 'package:e_commerce/modules/myhome_page/products_home/products_home.dart';
import 'package:e_commerce/modules/myhome_page/user_profile/user_profile.dart';
import 'package:e_commerce/modules/update_product/update_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../models/product.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class ProductTileUserProfile extends StatelessWidget {

  final Product product;
  ProductTileUserProfile(this.product);

  
  Future<bool> deleteProductService()async{
    var url = Uri.parse(ServerConfig.DomainNameServer+ServerConfig.deleteProduct+'/${product.productId}');

    var response = await http.delete(url,
    headers: {
      'Accept':'application/json',
      'Authorization':'Bearer ${User.user_token}'
    },
    );
    if(response.statusCode==200){
      print('Delete is Done');
      return true;
    }else{
      print('something went wrong suring the delete');
      return false;
    }

    
    
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  child: product.imageLink!= null
                      ? Image.file(product.imageLink!,fit: BoxFit.cover,)
                      : Image.network(ServerConfig.DomainNameServer+'/storage/product_images/${product.productImageName}',fit: BoxFit.cover,),
                ),
                Positioned(
                  top: -12,
                  right: -13,
                  child: Container(
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: PopupMenuButton<int>(
                      onSelected: (item)=> onSelected(context,item),
                      itemBuilder: (context)=>[
                        PopupMenuItem(child: Text('Update'),value: 0,),
                        PopupMenuItem(child: Text('Delete'),value: 1,),
                      ],
                    ),
                  ) ,
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.productName,
              maxLines: 2,
              style:
              TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Text(
              product.productDescription,
              maxLines: 2,
              style:
              TextStyle(fontWeight: FontWeight.w400),
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
            Text('\$${product.productPrice}',
                style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
            //Text('${product.productId}'),
          ],
        ),
      ),
    );
  }

  void onSelected(BuildContext context,int item)async{

    switch(item){
      case 0:
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return UpdateProduct(product);
        }));
        break;
      case 1:
        EasyLoading.show(status: 'Deleting...',dismissOnTap: true);
        bool deleteStatus = await deleteProductService();
        if(deleteStatus) {
          int index = userProfileController.userProducts.indexOf(product);
          userProfileController.userProducts.removeAt(index);
          productsHomeController.homeMainProducts.removeAt(index);
          EasyLoading.showSuccess('The product has been deleted successfully',duration: Duration(seconds: 3));
        }else{
          EasyLoading.showError('Error !',duration: Duration(seconds: 4));
        }
        break;
    }



  }
}