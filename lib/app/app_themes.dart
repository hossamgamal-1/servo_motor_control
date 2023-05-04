import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 2),
      ),
      filled: true,
      fillColor: Colors.transparent,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        ),
      ),
    ),
  );
}
