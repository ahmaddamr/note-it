import 'package:flutter/material.dart';

  
abstract class Styles {
  static const Color divider = Color(0xff787878);
  static const Color grey500 = Color(0xff4F4F4F);
  static const Color greyButton = Color(0xffF6F6F6);
  static const Color primary = Color(0xffF44832);


  static const onBoardingTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    // fontFamily: "Poppins",
    color: Colors.black,
    
  );
  static const onBoardingBody = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    // fontFamily: "Poppins",
    color: Colors.black
  );
  static const ButtonsStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    // fontFamily: "Poppins",
    color: Colors.black
  );
  static const SignStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    // fontFamily: "Poppins",
    color: Color(0xff3D3D3D)
  );
  static const textFieldStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    // fontFamily: "Poppins",
    color: Color(0xff3D3D3D)
  );
  static const policy = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    // fontFamily: "Poppins",
    color: Color(0xff787878)
  );

}