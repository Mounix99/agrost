import 'package:flutter/material.dart';

class DefinedColors {
  ///Primary
  static const _black1 = Color(0xFF191B1D);
  static const _gray1 = Color(0xFF6F7679);
  static const _gray2 = Color(0xFF929B9D);

  ///Background
  static const _bg = Color(0xFFFFFFFF);
  static const _onBg1 = Color(0xFFF4F6F8);
  static const _onBg2 = Color(0xFFECEEEE);
  static const _onBg3 = Color(0xFFE6EAED);

  ///Accent
  static const _green1 = Color(0xFFAEF416);
  static const _green2 = Color(0xFFDBFB9A);
  static const _green3 = Color(0xFFE0FB9B);
  static const _green4 = Color(0xFFA2BF51);

  ///Highlight
  static const _purple = Color(0xFFEDEFFE);
  static const _yellow = Color(0xFFF7FBD7);
  static const _pink = Color(0xFFF9F0FF);
  static const _babyBlue = Color(0xFFE4FDFE);
}

TextTheme get _textTheme => const TextTheme(
      displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, fontFamily: "Futura"),
      displayMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(letterSpacing: 0, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(letterSpacing: 0, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(color: DefinedColors._gray1),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 0),
    );
