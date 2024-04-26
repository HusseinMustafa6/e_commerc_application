
import 'dart:io';
import 'package:e_commerce/modules/edit_profile/edit_profile_service.dart';
import 'package:e_commerce/modules/myhome_page/user_profile/user_profile.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController{

  String fullName = '';
  String email = '';
  String phone = '';
  File? userImage;

  onInit(){
    super.onInit();
    fullName = userProfileController.fullName;
    email = userProfileController.email;
    phone = userProfileController.phone;

  }

  EditProfileService editProfileService = EditProfileService();
 bool updateStatus = false;
var message ;

  Future<bool> updateUserInfo()async{
    updateStatus = await editProfileService.updateProfile();
    message = editProfileService.message;

    return updateStatus;
  }



}