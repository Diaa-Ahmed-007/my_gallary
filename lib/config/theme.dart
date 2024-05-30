import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeDataMode {
  static ThemeData themeData = ThemeData(
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.rubik(
        fontSize: 28.sp,
        fontWeight: FontWeight.w800,
        color: const Color(0xff4A4A4A),
      ), // for my gellary
      bodyMedium: GoogleFonts.rubik(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: const Color(0xff4A4A4A),
      ), // for login title
      bodySmall: const TextStyle(
          fontSize: 18, color: Colors.grey), // for text field hint
      labelMedium: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white), //for login button submit
          
      labelSmall: GoogleFonts.rubik(
        fontSize: 14.sp,
        fontWeight: FontWeight.w200,
        color: const Color(0xff4A4A4A),
      ),//for text style in text field
      titleLarge: GoogleFonts.baloo2(
                  color: const Color(0xff4A4A4A),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500),
                  //for welcome below home screen
    ),
  );
}
