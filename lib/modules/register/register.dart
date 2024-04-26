import 'package:e_commerce/modules/register/register_controller.dart';
import 'package:e_commerce/my_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class Register extends StatefulWidget {


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  bool showText = false;
  bool showTextConfirm = false;

  RegisterController registerController = Get.find();

  Future<void> registerUser() async{

    EasyLoading.show(status: 'Loading...',dismissOnTap: true);
    await registerController.registerUserController();
    print(registerController.signUpStatus);
    if(registerController.signUpStatus){
      EasyLoading.showSuccess('SIGN UP Done',duration: Duration(seconds: 2));
      Get.offAllNamed('/login');
    }else{
      EasyLoading.showError(registerController.statusMsg,duration: Duration(seconds: 4));
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
      padding:  EdgeInsets.symmetric(horizontal: 20),
      child: ListView(

             children: [
                 SizedBox(height: 40,),
               Row(

                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   SizedBox(width: 100,
                     child: Divider( thickness: 2,color: Colors.white, ),
                   ),
                   Text(' Sign up ',style: TextStyle(fontSize: 21 ,color: Colors.white ,fontFamily: 'Pushster') ,),
                   SizedBox(width: 100,
                     child: Divider( thickness: 2,color: Colors.white, ),
                   ),
                 ],
               ),
               SizedBox(height:30 ,),
                 TextField(
    onChanged:(value){
        registerController.username =value;
    } ,
    cursorColor: Colors.white,
    decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2 ,color: Colors.black45 ),
    borderRadius: BorderRadius.circular(10) ,
    ),
    labelText: "User Name",
    hintText: "Enter Name",
    labelStyle: TextStyle(fontSize: 18 , color: Colors.white),
    hintStyle: TextStyle(fontSize: 18 , color: Colors.black45),
    icon: Icon(Icons.person , color: Colors.white) ,
    ),
    style: TextStyle(color: Colors.black),
    keyboardType: TextInputType.text,
    ),
               SizedBox(height:30 ,),
               TextField(
                 onChanged:(value){
                  registerController.email = value;
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
                 keyboardType: TextInputType.text,
               ),
               SizedBox(height:30 ,),
               TextField(
                 onChanged:(value){
                   registerController.phoneNumber= value.toString();
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
               SizedBox(height:30 ,),
               TextField(
                 onChanged:(value){
                   registerController.age= value.toString();
                 } ,
                 cursorColor: Colors.white,
                 decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 2 ,color: Colors.black45 ),
                     borderRadius: BorderRadius.circular(10) ,
                   ),
                   labelText: "Age",
                   hintText: "Enter your age",
                   labelStyle: TextStyle(fontSize: 18 , color: Colors.white),
                   hintStyle: TextStyle(fontSize: 18 , color: Colors.black45),
                   icon: Icon(Icons.cake, color: Colors.white) ,
                 ),
                 style: TextStyle(color: Colors.black),
                 keyboardType: TextInputType.number,
               ),
               SizedBox(height:30 ,),
               TextField(onChanged:(value){
                 registerController.password =value.toString();
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
               SizedBox(height:30 ,),
               TextField(onChanged:(value){
                 registerController.passwordconfirm = value.toString();
               }  ,cursorColor:Colors.white, decoration: InputDecoration(
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(width: 2 ,color: Colors.black45 ),
                   borderRadius: BorderRadius.circular(10) ,
                 ),
                 labelText: " Confirm Password ",
                 labelStyle: TextStyle(fontSize: 18 , color: Colors.white),
                 hintText: "Enter Password confirmation ",
                 hintStyle: TextStyle(fontSize: 18 , color: Colors.black45),
                 suffixIcon:IconButton(onPressed:(){
                   setState(() {
                     showTextConfirm = !showTextConfirm;
                   });

                 }   ,icon: Icon(showTextConfirm? Icons.visibility:Icons.visibility_off ) , color:Colors.white,),
                 icon: Icon(Icons.lock , color: Colors.white,) ,

               ),
                 style: TextStyle(color: Colors.black),
                 keyboardType: TextInputType.visiblePassword   ,
                 obscureText: showTextConfirm,
               ),
               SizedBox(height:30 ,),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 100.0),
                 child: CustomButton(buttonColor: Colors.purple[200], onPressed:(){registerUser();}, buttonText: 'SIGN UP'),
               ),
               SizedBox(height:5 ,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Already have an account? ',style: TextStyle(fontSize: 12,color: Colors.black),),
                   InkWell(child: Text('Login',style: TextStyle(fontSize: 12,color: Colors.blue ),), onTap: (){Get.toNamed('/login'); },)
                 ],
               ),
               SizedBox(height:20 ,),
      ],


      ),
    ),
    ),


    ));
    }
}
