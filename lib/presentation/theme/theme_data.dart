import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  light,
  dark,
}

final appThemeData = {
  AppTheme.light: ThemeData.light().copyWith(
    scaffoldBackgroundColor: ZPColors.white,
    primaryColor: ZPColors.primary,
    // primarySwatch: ZPColors.kPrimaryColor,
    // fontFamily: 'Poppins',
    iconTheme: const IconThemeData(
      color: ZPColors.lightGray,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ZPColors.darkBlue,
      unselectedItemColor: ZPColors.lightGray,
    ),
    tabBarTheme: const TabBarTheme(
      indicator: BoxDecoration(color: ZPColors.primary),
      labelColor: ZPColors.primary,
      unselectedLabelColor: ZPColors.lightGray,
      // labelStyle: TextStyle(
      //     fontSize: 15, fontWeight: FontWeight.w600),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ZPColors.primary,
      selectionColor: ZPColors.primary,
      selectionHandleColor: ZPColors.primary,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: ZPColors.primary),
      // labelStyle: TextStyle(color: ZPColors.primary),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ZPColors.primary),
      ),
      // enabledBorder: UnderlineInputBorder(
      //   borderSide: BorderSide(color: ZPColors.primary),
      // ),
      // border: UnderlineInputBorder(
      //   borderSide: BorderSide(color: ZPColors.primary),
      // ),
      iconColor: ZPColors.primary,
      focusColor: ZPColors.primary,
      hoverColor: ZPColors.primary,
      prefixIconColor: ZPColors.primary,
      suffixIconColor: ZPColors.primary,
      fillColor: ZPColors.primary,
      // contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(ZPColors.white),
      fillColor: MaterialStateProperty.all(ZPColors.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ZPColors.primary,
        // onPrimary: AppColors.black80,
        shape: const StadiumBorder(),
        // textStyle: ThemeData.light().textTheme.bodyText2,
        textStyle: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        // RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(8),
        // ),
        elevation: 0,
        minimumSize: const Size(120, 40),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: ZPColors.primary,
        padding: const EdgeInsets.all(15),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: ZPColors.primary,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(fontWeight: FontWeight.w600),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    ),
    cardTheme: const CardTheme(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
    ),
    errorColor: ZPColors.error,
  ),
  AppTheme.dark: ThemeData.dark().copyWith(),
};
