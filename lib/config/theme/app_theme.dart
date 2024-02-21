import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorList = <Color>[
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.pinkAccent,
  Colors.orange
];

const colorSeed = Color(0xff424CB8);
const scaffoldBackgroundColor = Color(0xFF202020);

class AppTheme {
  final int selectedColor;
  final bool mode;
  AppTheme({this.mode = false, this.selectedColor = 0})
      : assert(selectedColor >= 0, 'El color debe ser mayor que cero'),
        assert(selectedColor < colorList.length,
            'El color debe ser menor a la lista de colorres');

  ThemeData getTheme() => ThemeData(

      ///* General
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      brightness: mode ? Brightness.dark : Brightness.light,

      ///* Texts
      textTheme: TextTheme(
          titleLarge: GoogleFonts.montserratAlternates().copyWith(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          titleMedium: GoogleFonts.montserratAlternates().copyWith(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          titleSmall: GoogleFonts.montserratAlternates()
              .copyWith(fontSize: 20, color: Colors.white),
          labelMedium: GoogleFonts.montserratAlternates().copyWith(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
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
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ));

  AppTheme copyWith({int? selectedColor, bool? mode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      mode: mode ?? this.mode);
}
