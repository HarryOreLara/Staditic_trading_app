import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorSeed = Color(0xff424CB8);
const scaffoldBackgroundColor = Color(0xFF202020);

class AppTheme {
  ThemeData getTheme() => ThemeData(

      ///* General
      useMaterial3: true,
      colorSchemeSeed: colorSeed,

      ///* Texts
      textTheme: TextTheme(
          titleLarge: GoogleFonts.montserratAlternates().copyWith(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          titleMedium: GoogleFonts.montserratAlternates().copyWith(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          titleSmall: GoogleFonts.montserratAlternates()
              .copyWith(fontSize: 20, color: Colors.white),
          labelSmall: GoogleFonts.montserratAlternates()
              .copyWith(fontSize: 12, color: Colors.white)),

      ///* Scaffold Background Color
      scaffoldBackgroundColor: scaffoldBackgroundColor,

      ///* Buttons
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(
                  GoogleFonts.montserratAlternates()
                      .copyWith(fontWeight: FontWeight.w700)))),

      ///* AppBar
      appBarTheme: AppBarTheme(
        color: scaffoldBackgroundColor,
        titleTextStyle: GoogleFonts.montserrat().copyWith(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      ));
}
