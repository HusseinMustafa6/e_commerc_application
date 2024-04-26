import 'package:e_commerce/getx_binding/add_product_binding.dart';
import 'package:e_commerce/getx_binding/login_binding.dart';
import 'package:e_commerce/getx_binding/register_binding.dart';

import 'package:e_commerce/modules/add_product/add_product.dart';
import 'package:e_commerce/modules/edit_profile/edit_profile.dart';
import 'package:e_commerce/modules/login/login.dart';
import 'package:e_commerce/modules/myhome_page/myhome_page.dart';
import 'package:e_commerce/modules/myhome_page/user_profile/user_profile.dart';
import 'package:e_commerce/modules/product_info/product_info.dart';

import 'package:flutter/material.dart';
import 'package:e_commerce/modules/welcome_screen/welcome_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'getx_binding/user_profile_binding.dart';
import 'modules/register/register.dart';
import 'package:get/get.dart';

import 'modules/search/search.dart';


void main() {
  runApp(Ecommerce());
}


class Ecommerce extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        drawerTheme: DrawerThemeData(),
      ),
      initialRoute: '/welcome',
      getPages: [
        GetPage(name:'/welcome', page: ()=> WelcomeScreen() ),
        GetPage(name:'/register', page: ()=> Register() , binding: RegisterBinding()),
        GetPage(name: '/login', page:()=>Login() , binding: LoginBinding()),
        GetPage(name:'/home', page: ()=> MyHomePage() ),
        GetPage(name:'/new_product', page: ()=> NewProduct() , binding: NewProductBinding()),
        GetPage(name: '/user_profile', page:()=>UserProfile() , binding: UserProfileBinding()),
        GetPage(name:'/edit_profile', page: ()=> EditProfile() ),
        GetPage(name:'/search_page', page: ()=> SearchPage() ),
      ],
      builder: EasyLoading.init(),
    );
  }
}
