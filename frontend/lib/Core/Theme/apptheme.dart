import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey,

  // useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.black,
  ),

  // Text theme
  textTheme: GoogleFonts.ptSansTextTheme().copyWith(
    displayLarge:
        GoogleFonts.ptSans(fontSize: 24.0, fontWeight: FontWeight.bold),
    displayMedium:
        GoogleFonts.ptSans(fontSize: 20.0, fontWeight: FontWeight.bold),
    displaySmall:
        GoogleFonts.ptSans(fontSize: 18.0, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.ptSans(fontSize: 16.0),
    bodyMedium: GoogleFonts.ptSans(fontSize: 14.0),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.blueGrey),
    foregroundColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.white),
  )),

  // Button theme
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),

  // Input theme
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
  ),

  // Other customizations
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.blue,
    unselectedLabelColor: Colors.grey,
  ),
);
