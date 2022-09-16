import 'package:flutter/material.dart';

abstract class ZPColors {
  static const Color darkBlue = Color.fromRGBO(0, 57, 72, 1.0);
  static const Color darkGray = Color.fromRGBO(128, 128, 128, 1.0);
  static const Color darkGreen = Color.fromRGBO(128, 128, 0, 1.0);
  static const Color darkerGreen = Color.fromRGBO(5, 38, 8, 1.0);
  static const Color lightGray = Color.fromRGBO(179, 179, 179, 1.0);
  static const Color white = Color.fromRGBO(250, 250, 250, 1);

  static const Color error = Color.fromRGBO(227, 23, 16, 1);
  static const Color tender = Color.fromRGBO(246, 138, 37, 1);
  static const Color primary = Color.fromRGBO(0, 93, 98, 1.0);
  static const Color secondary = Color.fromRGBO(195, 213, 0, 1.0);
  static const Color gradient = Color.fromRGBO(0, 133, 138, 1.0);
  static const Color announcementColor = Color(0xffff7c65);

  static const MaterialColor kPrimaryColor = MaterialColor(
    0xFF005d62,
    <int, Color>{
      50: Color(0xFF005d62),
      100: Color(0xFF005d62),
      200: Color(0xFF005d62),
      300: Color(0xFF005d62),
      400: Color(0xFF005d62),
      500: Color(0xFF005d62),
      600: Color(0xFF005d62),
      700: Color(0xFF005d62),
      800: Color(0xFF005d62),
      900: Color(0xFF005d62),
    },
  );
}
