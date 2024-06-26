import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {

  final Color? buttonColor;
  final VoidCallback onPressed;
  final String buttonText;

  CustomButton({required this.buttonColor,required this.onPressed,required this.buttonText});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
          elevation: 5.0,
          color: buttonColor,
          borderRadius: BorderRadius.circular(20.0),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.white ),
            ),
          ),
        ),

    );
  }
}