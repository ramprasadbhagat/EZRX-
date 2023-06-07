import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

enum AppTheme {
  light,
  dark,
}

final appThemeData = {
  AppTheme.light: ThemeData.light().copyWith(
    //Colors
    scaffoldBackgroundColor: ZPColors.white,
    primaryColor: ZPColors.primary,
    canvasColor: ZPColors.extraLightGray,
    colorScheme: _colorScheme(),

    //Layout
    appBarTheme: _appBarTheme(),
    tabBarTheme: _tabBarTheme(),
    iconTheme: _iconTheme(),
    bottomAppBarTheme: _bottomAppBarTheme(),
    bottomNavigationBarTheme: _bottomNavigationBarTheme(),
    dialogTheme: _dialogTheme(),
    bottomSheetTheme: _bottomSheetTheme(),
    drawerTheme: _drawerTheme(),

    //Text
    textTheme: _textTheme(),
    primaryTextTheme: _textTheme(),
    textSelectionTheme: _textSelectionTheme(),
    inputDecorationTheme: _inputDecorationTheme(),

    //Buttons
    floatingActionButtonTheme: _floatingActionButtonTheme(),
    elevatedButtonTheme: _elevatedButtonTheme(),
    textButtonTheme: _textButtonTheme(),
    outlinedButtonTheme: _outlinedButtonTheme(),

    //Controls and UI Elements
    checkboxTheme: _checkboxTheme(),
    radioTheme: _radioTheme(),
    progressIndicatorTheme: _progressIndicatorTheme(),
    snackBarTheme: _snackBarTheme(),
    cardTheme: _cardTheme(),
    dividerTheme: _dividerTheme(),
    chipTheme: _chipTheme(),
  ),
  AppTheme.dark: ThemeData.dark().copyWith(),
};

ColorScheme _colorScheme() {
  return const ColorScheme.light().copyWith(
    primary: ZPColors.primary,
    background: ZPColors.white,
    secondary: ZPColors.secondary,
    onPrimary: ZPColors.black,
    error: ZPColors.error,
  );
}

//============================================================
//  LAYOUT
//============================================================

AppBarTheme _appBarTheme() {
  return AppBarTheme(
    centerTitle: true,
    color: ZPColors.white,
    titleTextStyle: GoogleFonts.notoSans(
      fontSize: 18,
      color: ZPColors.black,
    ),
    elevation: 2,
    shadowColor: ZPColors.shadowColor,
  );
}

TabBarTheme _tabBarTheme() {
  return const TabBarTheme(
    labelColor: ZPColors.primary,
    unselectedLabelColor: ZPColors.unselectedLabelColor,
    indicatorColor: ZPColors.white,
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: BoxDecoration(
      color: ZPColors.white,
    ),
  );
}

IconThemeData _iconTheme() {
  return const IconThemeData(
    color: ZPColors.primary,
  );
}

BottomAppBarTheme _bottomAppBarTheme() {
  return const BottomAppBarTheme(
    color: ZPColors.white,
    elevation: 2,
  );
}

BottomNavigationBarThemeData _bottomNavigationBarTheme() {
  return const BottomNavigationBarThemeData(
    selectedItemColor: ZPColors.primary,
    unselectedItemColor: ZPColors.unselectedLabelColor,
    type: BottomNavigationBarType.fixed,
    elevation: 2,
    backgroundColor: ZPColors.white,
  );
}

DialogTheme _dialogTheme() {
  return DialogTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    backgroundColor: ZPColors.white,
    elevation: 2,
  );
}

BottomSheetThemeData _bottomSheetTheme() {
  return BottomSheetThemeData(
    backgroundColor: ZPColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  );
}

DrawerThemeData _drawerTheme() {
  return const DrawerThemeData(
    backgroundColor: ZPColors.white,
  );
}

//============================================================
//  TEXT
//============================================================

TextTheme _textTheme() {
  return ThemeData.light().textTheme.copyWith(
        titleLarge: GoogleFonts.notoSans(
          fontSize: 18,
          color: ZPColors.black,
        ),
        titleMedium: GoogleFonts.notoSans(
          fontSize: 16,
          color: ZPColors.black,
        ),
        titleSmall: GoogleFonts.notoSans(
          fontSize: 14,
          color: ZPColors.black,
        ),
        labelLarge: GoogleFonts.notoSans(
          fontSize: 18,
          color: ZPColors.black,
          fontWeight: FontWeight.w700,
        ),
        labelMedium: GoogleFonts.notoSans(
          fontSize: 16,
          color: ZPColors.black,
          fontWeight: FontWeight.w700,
        ),
        labelSmall: GoogleFonts.notoSans(
          fontSize: 14,
          color: ZPColors.black,
          fontWeight: FontWeight.w700,
        ),
      );
}

TextSelectionThemeData _textSelectionTheme() {
  return const TextSelectionThemeData(
    cursorColor: ZPColors.primary,
    selectionColor: ZPColors.gradient,
    selectionHandleColor: ZPColors.primary,
  );
}

InputDecorationTheme _inputDecorationTheme() {
  return InputDecorationTheme(
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
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: ZPColors.inputBorderColor,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: ZPColors.inputBorderColor,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: ZPColors.inputBorderColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: ZPColors.red,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: ZPColors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    iconColor: ZPColors.primary,
    focusColor: ZPColors.primary,
    hoverColor: ZPColors.primary,
    prefixIconColor: ZPColors.primary,
    suffixIconColor: ZPColors.primary,
  );
}

//============================================================
//  BUTTONS
//============================================================

FloatingActionButtonThemeData _floatingActionButtonTheme() {
  return const FloatingActionButtonThemeData(
    elevation: 0,
    backgroundColor: ZPColors.orange,
    foregroundColor: ZPColors.white,
  );
}

ElevatedButtonThemeData _elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ZPColors.primary,
      foregroundColor: ZPColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      textStyle: GoogleFonts.notoSans(
        fontSize: 15,
        color: ZPColors.white,
      ),
      elevation: 0,
      minimumSize: const Size(120, 40),
    ),
  );
}

TextButtonThemeData _textButtonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: ZPColors.primary,
      textStyle: GoogleFonts.notoSans(
        fontSize: 15,
        color: ZPColors.white,
      ),
    ),
  );
}

OutlinedButtonThemeData _outlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: ZPColors.white,
      side: const BorderSide(color: ZPColors.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      textStyle: GoogleFonts.notoSans(
        fontSize: 15,
        color: ZPColors.white,
      ),
      elevation: 0,
      minimumSize: const Size(120, 40),
    ),
  );
}

//============================================================
//  CONTROLS AND UI ELEMENTS
//============================================================

CheckboxThemeData _checkboxTheme() {
  return CheckboxThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    checkColor: MaterialStateProperty.all(
      ZPColors.white,
    ),
    fillColor: MaterialStateProperty.all(
      ZPColors.primary,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        3.0,
      ),
    ),
  );
}

RadioThemeData _radioTheme() {
  return RadioThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    fillColor: MaterialStateProperty.all(
      ZPColors.primary,
    ),
  );
}

ProgressIndicatorThemeData _progressIndicatorTheme() {
  return const ProgressIndicatorThemeData(
    color: ZPColors.primary,
  );
}

SnackBarThemeData _snackBarTheme() {
  return const SnackBarThemeData(
    backgroundColor: ZPColors.primary,
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
  );
}

CardTheme _cardTheme() {
  return const CardTheme(
    elevation: 1.5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          8.0,
        ),
      ),
    ),
  );
}

DividerThemeData _dividerTheme() {
  return const DividerThemeData(
    space: 0,
    indent: 24,
    endIndent: 24,
    thickness: 1.5,
  );
}

ChipThemeData _chipTheme() {
  return ChipThemeData(
    backgroundColor: ZPColors.secondary,
    labelStyle: TextStyle(color: ZPColors.primary, fontSize: 8.sp),
    labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    padding: EdgeInsets.zero,
    shape: const StadiumBorder(),
  );
}
