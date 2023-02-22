import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

enum AppTheme {
  light,
  dark,
}

final appThemeData = {
  AppTheme.light: ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 18,
            color: ZPColors.black,
            fontFamily: 'Poppins',
          ),
          titleMedium: const TextStyle(
            fontSize: 16,
            color: ZPColors.black,
            fontFamily: 'Poppins',
          ),
          titleSmall: const TextStyle(
            fontSize: 14,
            color: ZPColors.black,
            fontFamily: 'Poppins',
          ),
        ),
    primaryTextTheme: ThemeData.light().textTheme.apply(fontFamily: 'Poppins'),
    scaffoldBackgroundColor: ZPColors.extraLightGray,
    primaryColor: ZPColors.primary,
    canvasColor: ZPColors.white,
    colorScheme: const ColorScheme.light().copyWith(
      primary: ZPColors.primary,
      background: ZPColors.white,
      secondary: ZPColors.secondary,
    ),
    iconTheme: const IconThemeData(
      color: ZPColors.lightGray,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ZPColors.primary,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: ZPColors.white,
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: ZPColors.black,
        fontFamily: 'Poppins',
      ),
      iconTheme: IconThemeData(
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
        color: ZPColors.white,
      ),
      labelColor: ZPColors.primary,
      unselectedLabelColor: ZPColors.lightGray,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ZPColors.primary,
      selectionColor: ZPColors.primary,
      selectionHandleColor: ZPColors.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(10),
      labelStyle: const TextStyle(
        fontSize: 14.0,
      ),
      floatingLabelStyle: const TextStyle(
        color: ZPColors.primary,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ZPColors.primary,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ZPColors.red,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ZPColors.kPrimaryColor,
        ),
      ),
      iconColor: ZPColors.primary,
      focusColor: ZPColors.primary,
      hoverColor: ZPColors.primary,
      prefixIconColor: ZPColors.primary,
      suffixIconColor: ZPColors.primary,
      fillColor: ZPColors.primary,
    ),
    checkboxTheme: CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
    radioTheme: RadioThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: MaterialStateProperty.all(
        ZPColors.primary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ZPColors.primary,
        // onPrimary: AppColors.black80,
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(
        //       8.0,
        //     ),
        //   ),
        // ),
        shape: const StadiumBorder(),
        // textStyle: ThemeData.light().textTheme.bodyText2,
        textStyle: const TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins',
          color: ZPColors.white,
          fontWeight: FontWeight.bold,
        ),
        // RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(8),
        // ),
        elevation: 0,
        minimumSize: const Size(120, 40),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: ZPColors.white,
        side: const BorderSide(color: ZPColors.primary),
        shape: const StadiumBorder(),
        textStyle: const TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins',
          color: ZPColors.white,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        minimumSize: const Size(120, 40),
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
      // margin: EdgeInsets.only(top: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
    ),
    // listTileTheme: const ListTileThemeData(
    //   contentPadding: EdgeInsets.zero,
    // ),
    dividerTheme: const DividerThemeData(
      // color: ZPColors.lightGray,
      space: 0,
      indent: 24,
      endIndent: 24,
      thickness: 1.5,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: ZPColors.secondary,
      labelStyle: TextStyle(color: ZPColors.primary, fontSize: 8.sp),
      labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      padding: EdgeInsets.zero,
      shape: const StadiumBorder(),
    ),
    errorColor: ZPColors.error,
  ),
  AppTheme.dark: ThemeData.dark().copyWith(),
};
