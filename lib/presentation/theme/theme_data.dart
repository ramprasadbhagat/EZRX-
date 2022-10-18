import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

enum AppTheme {
  light,
  dark,
}

final appThemeData = {
  AppTheme.light: ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
    primaryTextTheme: ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
    scaffoldBackgroundColor: ZPColors.extraLightGray,
    primaryColor: ZPColors.primary,
    // primarySwatch: ZPColors.kPrimaryColor,
    // fontFamily: 'Poppins',
    iconTheme: const IconThemeData(
      color: ZPColors.lightGray,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ZPColors.primary,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ZPColors.white,
      titleTextStyle:
          ThemeData.light().textTheme.headline1?.copyWith(fontSize: 21.sp),
      iconTheme: const IconThemeData(
        color: ZPColors.lightGray,
      ),
      elevation: 1,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ZPColors.darkBlue,
      unselectedItemColor: ZPColors.lightGray,
    ),
    tabBarTheme: const TabBarTheme(
      indicator: BoxDecoration(
        color: ZPColors.primary,
      ),
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
      floatingLabelStyle: TextStyle(
        color: ZPColors.primary,
      ),
      // labelStyle: TextStyle(color: ZPColors.primary),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ZPColors.primary,
        ),
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
      checkColor: MaterialStateProperty.all(
        ZPColors.white,
      ),
      fillColor: MaterialStateProperty.all(
        ZPColors.primary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          4.0,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ZPColors.primary,
        // onPrimary: AppColors.black80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              8.0,
            ),
          ),
        ), //const StadiumBorder(),
        // textStyle: ThemeData.light().textTheme.bodyText2,
        textStyle: TextStyle(
          fontSize: 21.sp,
          color: ZPColors.white,
          fontWeight: FontWeight.bold,
        ),
        // RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(8),
        // ),
        elevation: 0,
        minimumSize: const Size(
          120,
          40,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ZPColors.primary,
        padding: const EdgeInsets.all(
          15,
        ),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: ZPColors.primary,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
    ),
    cardTheme: const CardTheme(
      elevation: 0,
      margin: EdgeInsets.only(top: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(
      // color: ZPColors.lightGray,
      space: 0,
      indent: 24,
      endIndent: 24,
      thickness: 1.5,
    ),
    errorColor: ZPColors.error,
  ),
  AppTheme.dark: ThemeData.dark().copyWith(),
};
