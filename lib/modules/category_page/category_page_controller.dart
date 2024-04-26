

import 'package:e_commerce/modules/category_page/category_page.dart';
import 'package:get/state_manager.dart';

import '../../models/product.dart';
import '../myhome_page/products_home/products_home.dart';

class CategoryPageController extends GetxController{


  List categoryProducts = <Product>[].obs;
  var isLoading = true.obs;




  fetchProducts(String selectedCategory){

    for(int i =0 ; i<productsHomeController.homeMainProducts.length ;i++){
      if(productsHomeController.homeMainProducts[i].productCategory.toString() ==selectedCategory){
        if(categoryProducts.contains(productsHomeController.homeMainProducts[i])){

        }else {
          categoryProducts.add(productsHomeController.homeMainProducts[i]);
        }
      }

    }

  }

  @override
  void dispose() {
    super.dispose();
    categoryProducts =[];
  }
}