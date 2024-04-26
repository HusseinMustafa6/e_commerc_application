import 'package:e_commerce/config/services_config.dart';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/modules/edit_profile/edit_profile.dart';
import 'package:e_commerce/modules/myhome_page/user_profile/user_profile_controller.dart';
import 'package:e_commerce/my_widgets/product_tile_userprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../my_widgets/product_tile.dart';

UserProfileController userProfileController = Get.put(UserProfileController());

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Material(
                        color: Colors.transparent,
                        child:editProfileController.userImage==null? Container(
                          width: 110,
                          height: 110,
                          child: userProfileController.userImage==null? Image.asset('images/no_user.webp',fit: BoxFit.cover,):Image.network(ServerConfig.DomainNameServer+'/storage/profile_images/'+'${userProfileController.userImage}',fit: BoxFit.cover,),
                        ):Container(
                          width: 110,
                          height: 110,
                          child: Image.file(editProfileController.userImage!,fit: BoxFit.cover,),
                        )
                    ),
                  ),
                  SizedBox(width: 5,),
                   Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userProfileController.fullName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                        SizedBox(height: 8,),
                        Text(userProfileController.email,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                        SizedBox(height: 8,),
                        Text(userProfileController.phone,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                        SizedBox(height: 8,),
                        Obx(()=> Text('Balance  \$${userProfileController.balance}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
                      ],
                    ),
                  SizedBox(width: 45,),
                  Column(
                    children: [
                      IconButton(onPressed:(){
                        Get.offAllNamed('/edit_profile');
                      }, icon:Icon(Icons.edit) ),
                      Text('Edit'),
                      SizedBox(height: 5,),
                      IconButton(onPressed:(){
                        Get.offAllNamed('/login');
                        User.user_token ='';
                        User.userId = 0;
                        userProfileController.balance.value = 0;
                        userProfileController.userProducts = [];

                      }, icon:Icon(Icons.logout) ),
                      Text('Log Out')
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    'Your Products',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Divider(
                        thickness: 1,
                        color: Colors.black54,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Obx(() {
                  if (userProfileController.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return AlignedGridView.count(
                      crossAxisCount: 2,
                      itemCount: userProfileController.userProducts.length,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return ProductTileUserProfile(
                            userProfileController.userProducts[index]);
                      },
                    );
                  }
                }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.white30, width: 2),
        ),
        //backgroundColor: Colors.black54,
        splashColor: Colors.lightBlueAccent,
        onPressed: () {
          Get.offAllNamed('/new_product');
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
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
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Icon(
                Icons.add_shopping_cart,
                semanticLabel: "add product",
                color: Colors.black,
              ),
              Text(
                "   add   ",
                style: TextStyle(fontSize: 8, color: Colors.black),
              ),
              Text(
                " product",
                style: TextStyle(fontSize: 8, color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
CircleAvatar(
                   radius: 50.0,
                   backgroundImage: AssetImage('images/no_user.webp'),
                 ),
 */

/*
    Row(
               children: [
                 Icon(Icons.person),
                 SizedBox(width: 5,),
                 Text('Hussein Mustafa'),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Icon(Icons.email),
                 SizedBox(width: 5,),
                 Text('husain@gmail.com')
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.phone),
                 SizedBox(width: 5,),
                 Text('0958771969')
               ],
             ),
            SizedBox(height: 20,),

 */