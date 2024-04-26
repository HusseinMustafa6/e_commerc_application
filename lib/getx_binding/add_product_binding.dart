


import 'package:e_commerce/modules/login/login_controller.dart';
import 'package:get/get.dart';

import '../modules/add_product/add_product_controller.dart';

class NewProductBinding implements Bindings{

  @override
  void dependencies() {
    Get.put<NewProductController>(NewProductController());
  }




}