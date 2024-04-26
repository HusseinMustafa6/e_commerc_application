import 'package:e_commerce/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../my_widgets/custom_button.dart';

var check = false.obs;

class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool showText = false;

  LoginController loginController = Get.find();

  Future<void> loginUser()async {
    EasyLoading.show(status: 'Loading...',dismissOnTap: true);
    await loginController.loginUserController();
     if(loginController.loginstatus){
       EasyLoading.showSuccess('SIGN IN Done',duration: Duration(seconds: 2));
       Get.offAllNamed('/home');
       print(loginController.statusMsg);
     }else{
       if(loginController.loginService.message2=='Unauthenticated.')
       EasyLoading.showError(loginController.loginService.message2,duration: Duration(seconds: 4));
       else
         EasyLoading.showError(loginController.loginService.message2+'\n'+loginController.statusMsg,duration: Duration(seconds: 4));

     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:[Colors.blue.shade200 ,Colors.lightBlue.shade100,Colors.purple.shade100 ,Colors.purple.shade200 ],
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(width: 100,
                      child: Divider( thickness: 2,color: Colors.white, ),
                    ),
                    Text(' Sign in ',style: TextStyle(fontSize: 21 ,color: Colors.white ,fontFamily: 'Pushster') ,),
                    SizedBox(width: 100,
                      child: Divider( thickness: 2,color: Colors.white, ),
                    ),
                  ],
                ),
                SizedBox(height:30 ,),
                TextField(
                  onChanged:(value){
                    loginController.email = value;
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
                SizedBox(height:30 ,),
                TextField(onChanged:(value){
                  loginController.password =value;
                }  ,cursorColor:Colors.white, decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2 ,color: Colors.black45 ),
                    borderRadius: BorderRadius.circular(10) ,
                  ),
                  labelText: "Password ",
                  labelStyle: TextStyle(fontSize: 18 , color: Colors.white),
                  hintText: "Enter Password ",
                  hintStyle: TextStyle(fontSize: 18 , color: Colors.black45),
                  suffixIcon:IconButton(onPressed:(){
                    setState(() {
                      showText = !showText;
                    });

                  }   ,icon: Icon(showText? Icons.visibility:Icons.visibility_off ) , color:Colors.white,),
                  icon: Icon(Icons.lock , color: Colors.white,) ,

                ),
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.visiblePassword   ,
                  obscureText: showText,
                ),
                SizedBox(height:10 ,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.0),
                  child: CustomButton(buttonColor: Colors.blue[200], onPressed:(){loginUser(); }, buttonText: 'SIGN IN'),
                ),
                SizedBox(height:8 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You don\'t have an account? ',style: TextStyle(fontSize: 12,color: Colors.black),),
                    InkWell(child: Text('Register',style: TextStyle(fontSize: 12,color: Colors.blue ),), onTap: (){Get.offAllNamed('/register'); },)
                  ],
                ),



              ],


            ),
          ),

        ),


      ),

    );
  }
}
