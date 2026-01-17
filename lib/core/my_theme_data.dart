import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const primaryColor = Color(0xFF0E3A99);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFF4F7FF),
    appBarTheme: AppBarTheme(
      backgroundColor:  Color(0xFFF4F7FF),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF1C1C1C),
      ),
      displayLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      )
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: Color(0xFF1C1C1C),
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface:  Color(0xFFF4F7FF),
      onSurface: Colors.white,

    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF101127),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF101127),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
    brightness: Brightness.dark,
    textTheme: TextTheme(
        titleLarge: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF5669FF),
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFFFFFFFF),
        ),
        displayLarge: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Color(0xFF5669FF),
        )
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF5669FF),
      onPrimary: Colors.white,
      secondary: Color(0xFFFFFFFF),
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Color(0xFF101127),
      onSurface: Colors.white,
    ),
  );
}
