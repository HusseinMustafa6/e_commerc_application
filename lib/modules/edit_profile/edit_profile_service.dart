

import 'package:e_commerce/modules/edit_profile/edit_profile.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/modules/myhome_page/user_profile/user_profile.dart';

import '../../config/services_config.dart';
import '../../models/user.dart';


class EditProfileService{

  var message;

Future<bool> updateProfile()async{
  FormData formData = new FormData.fromMap({
    'name': editProfileController.fullName,
    'email': editProfileController.email ,
    'phone_number': editProfileController.phone ,
    'profile_photo': editProfileController.userImage!=null? await MultipartFile.fromFile(editProfileController.userImage!.path, filename:'p'):userProfileController.userImage,
  });

  Response response = await Dio().post(ServerConfig.DomainNameServer+ServerConfig.updateProfile,
  data: formData,
  options: Options(
    headers: {
      'Accept':'application/json',
      'Authorization':'Bearer ${User.user_token}'
    }
  ));

  if(response.statusCode==200){
    print('update');
    print(response.statusCode);
    userProfileController.fullName = editProfileController.fullName;
    userProfileController.email = editProfileController.email;
    userProfileController.phone = editProfileController.phone;

    message = response.data['message'];
    return true;
  }else{
    print('update');
    print(response.statusCode);
    message = 'Something went wrong , try again !';
    return false;
  }

}

}