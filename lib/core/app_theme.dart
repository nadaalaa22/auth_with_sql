import 'package:flutter/material.dart';

   ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xff6C63FF),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xff6C63FF),
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIconColor: const Color(0xff6C63FF),
      suffixIconColor: const Color(0xff6C63FF),

    ),
  );


   ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff6C63FF), // Primary color
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xff6C63FF),
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIconColor: const Color(0xff6C63FF),
      suffixIconColor: const Color(0xff6C63FF),
    ),
  );

