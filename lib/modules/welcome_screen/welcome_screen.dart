import 'package:e_commerce/my_widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';


const colorizeColors = [
  Colors.blue,
  Colors.purple,
  Colors.purpleAccent,
  Colors.lightBlue,
];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Pushster',
);


class WelcomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           child: Padding(
             padding: EdgeInsets.symmetric(horizontal: 25),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Image.asset('images/e_commerce1.png',width: 300,height: 300,),
                 SizedBox(
                   width: 250.0,
                   child: AnimatedTextKit(
                     animatedTexts: [
                       ColorizeAnimatedText(
                         'Welcome',
                         textStyle: colorizeTextStyle,
                         colors: colorizeColors,
                         speed: Duration(milliseconds: 800),
                         textAlign: TextAlign.center,
                       ),
                     ],
                     isRepeatingAnimation: true,
                     repeatForever: true,

                     onTap: () {
                       print("Tap Event");
                     },
                   ),
                 ),
                 SizedBox(
                   width: 250.0,
                   child: AnimatedTextKit(
                     animatedTexts: [
                       ColorizeAnimatedText(
                         'E-Commerce App',
                         textStyle: colorizeTextStyle,
                         colors: colorizeColors,
                         speed: Duration(milliseconds: 600),
                         textAlign: TextAlign.center,
                       ),
                     ],
                     isRepeatingAnimation: true,
                     repeatForever: true,

                     onTap: () {
                       print("Tap Event");
                     },
                   ),
                 ),
                 SizedBox(height: 150),
                 SizedBox(
                   width: 250.0,
                   child: DefaultTextStyle(
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 18.0,
                         color: Colors.grey[800]
                     ),
                     child: AnimatedTextKit(
                       totalRepeatCount: 3,
                       animatedTexts: [
                         TypewriterAnimatedText('Sign up to get started',speed: Duration(milliseconds: 100) ,textAlign: TextAlign.center),
                       ],
                       onTap: () {
                         print("Tap Event");
                       },
                     ),
                   ),
                 ) ,
                   CustomButton(buttonColor: Colors.blue[400], onPressed: (){
                     Get.toNamed('/register');
                     }
                     , buttonText:'Sign Up'),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Already have an account? ',style: TextStyle(fontSize: 12,color: Colors.black),),
                     InkWell(child: Text('Login',style: TextStyle(fontSize: 12,color: Colors.blue ),), onTap: (){Get.toNamed('/login'); },)
                   ],
                 )





               ],
             ),
           ),
        ),
      ),
    );
  }
}

/*
decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:[Colors.blue ,Colors.lightBlue,Colors.lightBlueAccent ,Colors.blue.withOpacity(0.6) ,  ],

              )


          ),


           Text('Get Ready to start shopping from your home,work or anywhere in the easiest way possible',style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20.0,
                       color: Colors.grey[800]
                   ),textAlign: TextAlign.center,),
 */