import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {

  static Color primaryColor = const Color(0xFF5D9CEC);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFFDFECDB),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      onPrimary: primaryColor,
      onSecondary: const Color(0xFFDFECDB),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: primaryColor,
      elevation: 0.0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
      ),
      selectedItemColor: primaryColor,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey.shade500,
      ),
      unselectedItemColor: Colors.grey.shade500,
    ),
    textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: primaryColor,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        )),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    // bottomSheetTheme: BottomSheetThemeData(
    //   backgroundColor: const Color(0xFFB7935F).withOpacity(0.7),
    // ),
    dividerColor: const Color(0xFFB7935F),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF141A2E),
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF141A2E),
      onPrimary: const Color(0xFF141A2E),
      onSecondary: const Color(0xFFFACC1D),
      primary: const Color(0xFFFACC1D),
      background: const Color(0xFF141A2E),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        iconTheme: IconThemeData(color: Colors.white)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF141A2E),
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        size: 32,
        color: Color(0xFFFACC1D),
      ),
      selectedItemColor: Color(0xFFFACC1D),
      unselectedIconTheme: IconThemeData(
        size: 26,
        color: Colors.white,
      ),
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        )),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: const  Color(0xFF141A2E).withOpacity(0.7),
    ),
    dividerColor: const Color(0xFFFACC1D),
  );
}