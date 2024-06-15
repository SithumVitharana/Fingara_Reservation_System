import 'package:flutter/material.dart';

// Light Mode Theme
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.grey.shade400,
    secondary: Colors.grey.shade200,
    onBackground: Colors.black, // Text color in light mode
  ),
);

// Dark Mode Theme
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade600,
    onBackground: Colors.white, // Text color in dark mode
  ),
);