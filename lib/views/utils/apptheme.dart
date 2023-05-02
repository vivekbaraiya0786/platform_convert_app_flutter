import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.blue,
      inversePrimary: Colors.blue,
      secondary: Colors.red,
    ),
  );

  static ThemeData Darktheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
      inversePrimary: Colors.blue,
      secondary: Colors.red,
    ),
  );
}
