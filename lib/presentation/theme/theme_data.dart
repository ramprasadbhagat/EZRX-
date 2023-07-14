import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    navigationRailTheme: _navigationRailTheme(),
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
    listTileTheme: _listTileTheme(),
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
    elevation: 5,
    shadowColor: ZPColors.boxShadowColor,
  );
}

TabBarTheme _tabBarTheme() {
  return const TabBarTheme(
    labelColor: ZPColors.primary,
    unselectedLabelColor: ZPColors.unselectedLabelColor,
    indicatorColor: ZPColors.primary,
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        color: ZPColors.primary,
        width: 2.0,
      ),
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

NavigationRailThemeData _navigationRailTheme() {
  return NavigationRailThemeData(
    elevation: 2,
    backgroundColor: ZPColors.white,
    indicatorColor: ZPColors.primary,
    // useIndicator: true,
    labelType: NavigationRailLabelType.all,
    selectedLabelTextStyle: GoogleFonts.notoSans(
      fontSize: 18,
      color: ZPColors.primary,
    ),
    unselectedLabelTextStyle: GoogleFonts.notoSans(
      fontSize: 18,
      color: ZPColors.unselectedLabelColor,
    ),
    selectedIconTheme: const IconThemeData(color: ZPColors.primary),
    unselectedIconTheme:
        const IconThemeData(color: ZPColors.unselectedLabelColor),
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
          letterSpacing: 0.25,
        ),
        titleMedium: GoogleFonts.notoSans(
          fontSize: 16,
          color: ZPColors.black,
          letterSpacing: 0.25,
        ),
        titleSmall: GoogleFonts.notoSans(
          fontSize: 14,
          color: ZPColors.black,
          letterSpacing: 0.25,
        ),
        labelLarge: GoogleFonts.notoSans(
          fontSize: 18,
          color: ZPColors.black,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.25,
        ),
        labelMedium: GoogleFonts.notoSans(
          fontSize: 16,
          color: ZPColors.black,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.25,
        ),
        labelSmall: GoogleFonts.notoSans(
          fontSize: 14,
          color: ZPColors.black,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.25,
        ),
        bodyLarge: GoogleFonts.notoSans(
          fontSize: 14,
          color: ZPColors.black,
          letterSpacing: 0.25,
        ),
        bodyMedium: GoogleFonts.notoSans(
          fontSize: 13,
          color: ZPColors.black,
          letterSpacing: 0.25,
        ),
        bodySmall: GoogleFonts.notoSans(
          fontSize: 12,
          color: ZPColors.black,
          letterSpacing: 0.25,
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
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    labelStyle: GoogleFonts.notoSans(
      fontSize: 14.0,
    ),
    hintStyle: GoogleFonts.notoSans(
      fontSize: 16,
      color: ZPColors.neutralsGrey,
      letterSpacing: 0.25,
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
    filled: true,
    fillColor: ZPColors.white,
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
        fontWeight: FontWeight.w600,
      ),
      elevation: 0,
      disabledBackgroundColor: ZPColors.lightPrimary,
      minimumSize: const Size(120, 45),
    ),
  );
}

TextButtonThemeData _textButtonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: GoogleFonts.notoSans(
        fontSize: 14,
        color: ZPColors.textButtonColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
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
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
      ),
      elevation: 0,
      minimumSize: const Size(120, 45),
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
    fillColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected)
          ? ZPColors.primary
          : ZPColors.darkGray,
    ),
    visualDensity: VisualDensity.compact,
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
    color: ZPColors.dividerColor,
  );
}

ChipThemeData _chipTheme() {
  return const ChipThemeData(
    backgroundColor: ZPColors.secondaryEmerald10,
    labelPadding: EdgeInsets.symmetric(horizontal: 10),
    labelStyle: TextStyle(fontSize: 14, letterSpacing: 0.25, height: 1.1),
    selectedColor: ZPColors.primary,
    padding: EdgeInsets.zero,
  );
}

ListTileThemeData _listTileTheme() {
  return const ListTileThemeData(
    iconColor: ZPColors.primary,
    textColor: ZPColors.primary,
  );
}
