import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primarySwatch: const MaterialColor(0xFF321C8B, {
    50: Color(0xFFE5E3EE),
    100: Color(0xFFBFB8D8),
    200: Color(0xFF998AC3),
    300: Color(0xFF7252AE),
    400: Color(0xFF532F9D),
    500: Color(0xFF321C8B), // Set the desired primary color
    600: Color(0xFF2D197F),
    700: Color(0xFF281673),
    800: Color(0xFF231367),
    900: Color(0xFF1D0F5B),
  }),
  colorScheme: const ColorScheme.dark(
    background: Colors.white,
  ),
);
