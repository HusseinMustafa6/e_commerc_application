
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/modules/myhome_page/products_home/products_home_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProductsHomeController extends GetxController{

  List<Product> homeMainProducts = <Product>[].obs; //the main list of the app products
  var isLoading = true.obs;


  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }



  ProductsHomeService productsHomeService = ProductsHomeService();

  fetchAllProducts() async {
    isLoading(true);
    var responseProductsList = await productsHomeService.fetchAllProductsService();

    if (responseProductsList.isNotEmpty) {
      for (int i = 0; i < responseProductsList.length; i++) {

        int temp = responseProductsList[i]['user_id'];

        Product product = Product(productName: responseProductsList[i]['name'],
            productDescription: responseProductsList[i]['description'],
            productPrice: responseProductsList[i]['price'],
            productCategory:availableCategories[responseProductsList[i]['category_id']-1],
            imageLink: null,
            productQuantity: responseProductsList[i]['quantity'],
          isAdminProduct: temp==1? true:false,
             );

        product.productId =  responseProductsList[i]['id'];
        product.productImageName= responseProductsList[i]['image_url'];//the image name


        product.ownerOfProductID = responseProductsList[i]['user_id'];


        homeMainProducts.add(product);
      }
    }else{
      EasyLoading.showError('Error While fetching the data !',duration: Duration(seconds: 4));
    }
    isLoading(false);
  }
}