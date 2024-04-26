
import 'dart:io';
import 'package:e_commerce/modules/edit_profile/edit_profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/services_config.dart';
import '../../my_widgets/custom_button.dart';
import '../myhome_page/myhome_page.dart';
import '../myhome_page/user_profile/user_profile.dart';

EditProfileController editProfileController = Get.put(EditProfileController());

class EditProfile extends StatefulWidget {


  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;


  Future<void> updateInfo()async{
    EasyLoading.show(status:'Loading...',dismissOnTap: true);
    bool updateStatus = await editProfileController.updateUserInfo();
    if(updateStatus){
      EasyLoading.showSuccess(editProfileController.message,duration: Duration(seconds: 3));
      MyHomePage.currentIndex.value = 3;
      Get.offAllNamed('/home');
    }else{
      EasyLoading.showError(editProfileController.message,duration: Duration(seconds: 3));
    }

  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
          source: source); //selected image will be stored here
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.shade200,
                    Colors.lightBlue.shade100,
                    Colors.purple.shade100,
                    Colors.purple.shade200
                  ],
                )),
            child: Padding(
              padding:  EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(

                  children: [
                    SizedBox(height: 10,),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(width: 100,
                          child: Divider( thickness: 2,color: Colors.white, ),
                        ),
                        Text(' Edit Info ',style: TextStyle(fontSize: 21 ,color: Colors.white ,fontFamily: 'Pushster') ,),
                        SizedBox(width: 100,
                          child: Divider( thickness: 2,color: Colors.white, ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.edit,color: Colors.black,),
                        SizedBox(width: 8,),
                        Expanded(
                          child: Text('Here you can change your Informations , change only the fields that you want not all the fields are required.',
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700 ,color: Colors.black54),maxLines: 3,),
                        ),
                      ],
                    ),
                    SizedBox(height:10 ,),
                    ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child:Container(
                          width: 128,
                          height: 128,
                          child: image==null? (userProfileController.userImage==null? Image.asset('images/no_user.webp',fit: BoxFit.cover,):Image.network(ServerConfig.DomainNameServer+'/storage/profile_images/'+'${userProfileController.userImage}',fit: BoxFit.cover,)):Image.file(image!,fit: BoxFit.cover,),
                        )
                      ),
                    ),
                    SizedBox(height:20 ,),
                    TextField(
                      onChanged:(value){
                        editProfileController.fullName =value;
                      } ,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2 ,color: Colors.black45 ),
                          borderRadius: BorderRadius.circular(10) ,
                        ),
                        labelText: "User Name",
                        hintText: "Enter Full Name",
                        labelStyle: TextStyle(fontSize: 18 , color: Colors.white),
                        hintStyle: TextStyle(fontSize: 18 , color: Colors.black45),
                        icon: Icon(Icons.person , color: Colors.white) ,
                      ),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height:20 ,),
                    TextField(
                      onChanged:(value){
                      editProfileController.email = value;
                      } ,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2 ,color: Colors.black45 ),
                          borderRadius: BorderRadius.circular(10) ,
                        ),
                        labelText: "Email",
                        hintText: "Enter your email",
                        labelStyle: TextStyle(fontSize: 18 , color: Colors.white),
                        hintStyle: TextStyle(fontSize: 18 , color: Colors.black45),
                        icon: Icon(Icons.email, color: Colors.white) ,
                      ),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height:20 ,),
                    TextField(
                      onChanged:(value){
                     editProfileController.phone = value;
                      } ,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2 ,color: Colors.black45 ),
                          borderRadius: BorderRadius.circular(10) ,
                        ),
                        labelText: "Phone",
                        hintText: "Enter your phone number",
                        labelStyle: TextStyle(fontSize: 18 , color: Colors.white),
                        hintStyle: TextStyle(fontSize: 18 , color: Colors.black45),
                        icon: Icon(Icons.phone, color: Colors.white) ,
                      ),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20,),
                    Text('Profile Image', style: TextStyle(fontSize: 22,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                    SizedBox(height:10 ,),
                    Column(
                      children: <Widget>[
                        FlatButton(onPressed: ()async {
                          await pickImage(ImageSource.gallery);
                          setState(() {
                            editProfileController.userImage = image;
                          });
                        },
                            color: Colors.greenAccent,
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.3,
                              child: Row(
                                children: [
                                  Icon(Icons.photo),
                                  SizedBox(width: 10,),
                                  Text('Pick gallery', style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),)
                                ],
                              ),
                            )
                        ),
                        SizedBox(height: 15,),
                        FlatButton(onPressed: () async{
                          await pickImage(ImageSource.camera);
                          setState(() {
                            editProfileController.userImage = image;
                          });

                        },
                            color: Colors.greenAccent,
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.3,
                              child: Row(
                                children: [
                                  Icon(Icons.camera),
                                  SizedBox(width: 10,),
                                  Text('Pick camera', style: TextStyle(fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),)
                                ],
                              ),
                            )
                        ),

                      ],
                    ),
                    SizedBox(height:10 ,),
                    Row(
                      children: [
                        Expanded(child: CustomButton(buttonColor: Colors.blue[300], onPressed:()async {await updateInfo();}, buttonText: 'Update')),
                        SizedBox(width: 50,),
                        Expanded(child: CustomButton(
                          onPressed: () {
                            MyHomePage.currentIndex.value = 3;
                            Get.offAllNamed('/home');
                          },
                          buttonText: 'Cancel',
                          buttonColor: Colors.purple[300],
                        ))
                      ],
                    ),
                  ],


                ),
              ),
            ),
          ),


        ));;
  }
}

/*
  SizedBox(height: 20,),
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child:Ink.image(
                      image: AssetImage('images/no_user.webp',),
                      fit: BoxFit.cover,
                      width: 128,
                      height: 128,
                      child: InkWell(onTap: (){},),
                    ),
                  ),
                ),
 */