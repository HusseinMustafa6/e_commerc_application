import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/modules/myhome_page/favorite_page/favorite_page_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController{

  List<Product> likedProducts = <Product>[].obs;
  List<int> itemsIndex = <int>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLikedProducts();
  }



  MyFavoriteService myFavoriteService = MyFavoriteService();


  fetchLikedProducts()async {
    isLoading(true);
    var productsList = await myFavoriteService.fetchLikedProducts();
    if (productsList.isNotEmpty) {
      for (int i = 0; i < productsList.length; i++) {
        Product product = Product(productName: productsList[i]['product']['name'],
            productDescription: productsList[i]['product']['description'],
            productPrice: productsList[i]['product']['price'],
            productCategory:availableCategories[productsList[i]['product']['category_id']-1],
            imageLink: null,
            productQuantity: productsList[i]['product']['quantity'],
            isAdminProduct: false,
            );

        product.isFavorite.value=true;
        product.productId = productsList[i]['product_id'];
        product.productImageName= productsList[i]['product']['image_url'];//the image name

         likedProducts.add(product);
         itemsIndex.add(productsList[i]['id']);
      }
      print(itemsIndex);
    }else{

    }
    isLoading(false);

  }
}