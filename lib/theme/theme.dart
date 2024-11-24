import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.grey.shade100,
      onPrimary: Colors.black,
      secondary: Colors.grey,
      onSecondary: Colors.black87,
      error: Colors.red,
      onError: Colors.black,
      surface: Colors.grey.shade400,
      onSurface: Colors.black
  ),
);


ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.blue.shade900,
        onPrimary: Colors.yellow.shade300,
        secondary: Colors.deepPurple.shade600,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.black,
        surface: Colors.deepPurple.shade800,
        onSurface: Colors.yellow.shade300
    )
);