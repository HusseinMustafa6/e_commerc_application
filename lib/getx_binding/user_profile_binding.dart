

import 'package:e_commerce/modules/myhome_page/user_profile/user_profile_controller.dart';
import 'package:get/get.dart';

class UserProfileBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<UserProfileController>(UserProfileController());
  }




}