import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static final themeData = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF181C14),
    primaryColor: const Color(0xFFECDFCC),
    shadowColor: const Color(0xFF3C3D37),
    primaryIconTheme: const IconThemeData(
      color:  Color(0xFF181C14),
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFFECDFCC),
        ),
      ),
      headlineMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFFECDFCC),
        ),
      ),
      headlineSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFFECDFCC),
        ),
      ),
      bodyLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 18.0,
          color: Color(0xFFECDFCC),
        ),
      ),
      bodyMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 14.0,
          color: Color(0xFFECDFCC),
        ),
      ),
      bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 10.0,
          color: Color(0xFFECDFCC),
        ),
      ),
    )
  );
}