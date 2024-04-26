

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../modules/register/register_controller.dart';

class RegisterBinding implements Bindings{


  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController());
  }


}