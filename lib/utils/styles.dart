import 'package:flutter/material.dart';
import 'package:zero_hunger/utils/colors.dart';

class Styles{

  static const String font = 'Rubik';

  TextStyle simpleTitleTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  TextStyle bigTitleTextStyle = TextStyle(
    fontSize: 35,
    fontFamily: font,
    fontWeight: FontWeight.bold,
  );

  TextStyle titleTextStyle = TextStyle(
    fontSize: 22,
    fontFamily: font,
    fontWeight: FontWeight.bold,
  );

  TextStyle subTitleTextStyle = TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  TextStyle simpleTextStyle = TextStyle(
    fontFamily: font,
    fontWeight: FontWeight.normal,
  );
}

class HeadingStylesGradient {
  static const white = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static const black = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static const primary = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: Colorz.primary,
  );
}

class SubHeadingStylesMaterial {
  static const light = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 20.0,
//    fontWeight: FontWeight.w700,
    color: Colorz.light,
  );
  static const dark = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 20.0,
//    fontWeight: FontWeight.w700,
    color: Colorz.dark,
  );
  static const primary = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 20.0,
//    fontWeight: FontWeight.w700,
    color: Colorz.primary,
  );
}