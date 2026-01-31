import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const primaryColor = Color(0xFF0E3A99);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFFF4F7FF),
    primaryColor: primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,

        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFF4F7FF),
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF1C1C1C),
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0xFF1C1C1C),
      ),
      displayLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF686868),
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor, //red
      onPrimary: Colors.white,
      secondary: Color(0xFF1C1C1C), // white
      onSecondary: primaryColor,
      error: Colors.red,
      onError: Colors.white,
      surface: Color(0xFFF4F7FF),
      onSurface: Colors.white,
      onInverseSurface: Colors.white,






    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF101127),
    primaryColor: Color(0xFF5669FF),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF101127),
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF5669FF),

        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
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
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF5669FF), // blue
      onPrimary: Colors.white,
      secondary: Color(0xFFFFFFFF), /// input
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Color(0xFF000F30),
      onSurface: Colors.white,

      onInverseSurface: Color(0xFF001440)
    ),
  );
}
