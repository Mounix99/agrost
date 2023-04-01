import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  ///Functional
  static const _red = Color(0xFFF05365);
  static const _green = Color(0xFF00A896);
  static const _yellow1 = Color(0xFFFBBC2B);
}

TextStyle get inter => GoogleFonts.inter();

TextTheme get _textTheme => TextTheme(
      ///H
      displayLarge: const TextStyle(fontSize: 24, height: 32, fontWeight: FontWeight.bold, fontFamily: "Futura"),
      displayMedium: const TextStyle(fontSize: 20, height: 28, fontWeight: FontWeight.bold, fontFamily: "Futura"),
      displaySmall: const TextStyle(fontSize: 16, height: 22, fontWeight: FontWeight.bold, fontFamily: "Futura"),
      headlineMedium: const TextStyle(fontSize: 12, height: 16, fontWeight: FontWeight.bold, fontFamily: "Futura"),

      ///Titles
      headlineSmall: const TextStyle(fontSize: 18, height: 24, fontWeight: FontWeight.w500, fontFamily: "Futura"),
      titleLarge: const TextStyle(fontSize: 16, height: 22, fontWeight: FontWeight.w500, fontFamily: "Futura"),

      ///Body
      titleMedium: inter.copyWith(fontSize: 16, height: 20, fontWeight: FontWeight.w400),

      ///Hint (not implemented yet)
      titleSmall: inter.copyWith(fontSize: 12, height: 16, fontWeight: FontWeight.w400),

      bodyLarge: const TextStyle(letterSpacing: 0, fontWeight: FontWeight.normal),
      bodyMedium: const TextStyle(letterSpacing: 0, fontWeight: FontWeight.normal),
      bodySmall: const TextStyle(color: DefinedColors._gray1),
      labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 0),
    );

FlexColorScheme _flexColorScheme({bool darkMode = false}) {
  return FlexColorScheme(
    colorScheme: darkMode ? _darkColorScheme : _lightColorScheme,
    useMaterial3: true,
    textTheme: _textTheme,
    primaryTextTheme: _textTheme,
    tabBarStyle: FlexTabBarStyle.forAppBar,
    subThemesData: const FlexSubThemesData(
        fabUseShape: false,
        useTextTheme: true,
        blendTextTheme: false,
        inputDecoratorIsFilled: false,
        defaultRadius: 4,
        outlinedButtonRadius: 6,
        elevatedButtonRadius: 6,
        textButtonRadius: 6,
        toggleButtonsRadius: 6),
  );
}

ColorScheme get _lightColorScheme {
  return ColorScheme.light(
      //
      // /// Primary colors
      // primary: ,
      // onPrimary: ,
      // primaryContainer: ,
      // onPrimaryContainer: ,
      //
      // /// Secondary
      // secondary: ,
      // onSecondary: ,
      // secondaryContainer: ,
      // onSecondaryContainer: ,
      //
      // /// Tertiary.
      // tertiary: ,
      // onTertiary: ,
      // tertiaryContainer: ,
      // onTertiaryContainer: ,
      //
      // /// Surfaces
      // surface: ,
      // onSurface: ,
      // surfaceVariant: ,
      // onSurfaceVariant: ,
      // error: ,
      // background: ,
      // onBackground: ,
      //
      // ///Other
      // outline: ,
      // onError:
  );
}

ColorScheme get _darkColorScheme {
  return const ColorScheme.dark(
    //
    // /// Primary colors
    // primary: ,
    // onPrimary: ,
    // primaryContainer: ,
    // onPrimaryContainer: ,
    //
    // /// Secondary
    // secondary: ,
    // onSecondary: ,
    // secondaryContainer: ,
    // onSecondaryContainer: ,
    //
    // /// Tertiary.
    // tertiary: ,
    // onTertiary: ,
    // tertiaryContainer: ,
    // onTertiaryContainer: ,
    //
    // /// Surfaces
    // surface: ,
    // onSurface: ,
    // surfaceVariant: ,
    // onSurfaceVariant: ,
    // error: ,
    // background: ,
    // onBackground: ,
    //
    // ///Other
    // outline: ,
    // onError:
  );
}

ThemeData get generalTheme => _subThemes(_flexColorScheme());

ThemeData _subThemes(FlexColorScheme flexColorScheme) {
  final themeData = flexColorScheme.toTheme;
  final colorScheme = flexColorScheme.toScheme;
  return themeData.copyWith(
    navigationBarTheme: NavigationBarThemeData(
      surfaceTintColor: Colors.white,
      indicatorColor: DefinedColors._onBg1,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide
    )
  );
}