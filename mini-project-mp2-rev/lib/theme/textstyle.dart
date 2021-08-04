import 'package:flutter/material.dart';
import 'package:mini_project/theme/color.dart';

class TextPalette {
  static TextStyle secondaryTxtStyle = TextStyle(
    color: ColorPalette.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    fontSize: 22,
  );

  static TextStyle altTextStyle = TextStyle(
    // fontStyle: FontStyle.italic,
    color: ColorPalette.black,
    fontSize: 12,
  );

  static TextStyle dataTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorPalette.black,
    fontSize: 12,
  );

  static TextStyle headTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorPalette.black,
    fontSize: 16,
  );

  static TextStyle fieldStyle = TextStyle(
    color: ColorPalette.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    fontSize: 16,
  );

  static TextStyle btnStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
}
