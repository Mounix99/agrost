import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
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
  static const _green1 = Color(0xFFDBFB9A);
  static const _green2 = Color(0xFFD1FF5A);
  static const _green3 = Color(0xFFAEF416);

  ///Highlight
  static const _purple = Color(0xFFEDEFFE);
  static const _yellow = Color(0xFFF7FBD7);
  static const _pink = Color(0xFFF9F0FF);
  static const _babyBlue = Color(0xFFE4FDFE);

  ///Functional
  static const _error = Color(0xFFFF685F);
}

TextStyle get inter => GoogleFonts.inter();

TextTheme get _textTheme => TextTheme(
      ///H
      displayLarge: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "Futura", color: DefinedColors._black1),
      displayMedium: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Futura", color: DefinedColors._black1),
      displaySmall: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Futura", color: DefinedColors._black1),

      ///Titles
      titleLarge: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Futura", color: DefinedColors._black1),
      titleMedium: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "Futura", color: DefinedColors._black1),
      titleSmall: inter.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: DefinedColors._black1),

      ///Body
      bodyMedium: inter.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: DefinedColors._black1),
      bodySmall: inter.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: DefinedColors._black1),
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
        blendTextTheme: true,
        tintedDisabledControls: false,
        inputDecoratorIsFilled: false,
        defaultRadius: 4,
        outlinedButtonRadius: 6,
        elevatedButtonRadius: 6,
        textButtonRadius: 6,
        toggleButtonsRadius: 6),
  );
}

ColorScheme get _lightColorScheme {
  return const ColorScheme.light(
    /// Primary colors
    primary: DefinedColors._black1,
    onPrimary: DefinedColors._gray1,
    primaryContainer: DefinedColors._gray2,
    // onPrimaryContainer: ,

    /// Secondary
    secondary: DefinedColors._green1,
    onSecondary: DefinedColors._green2,
    secondaryContainer: DefinedColors._green3,
    // onSecondaryContainer: ,

    /// Tertiary.
    tertiary: DefinedColors._purple,
    onTertiary: DefinedColors._yellow,
    tertiaryContainer: DefinedColors._pink,
    onTertiaryContainer: DefinedColors._babyBlue,

    /// Surfaces
    surface: DefinedColors._bg,
    onSurface: DefinedColors._onBg1,
    surfaceVariant: DefinedColors._onBg2,
    onSurfaceVariant: DefinedColors._onBg3,
    error: DefinedColors._error,
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

ThemeData? _generalTheme;

bool enableHotReloadTheme = kDebugMode;

ThemeData? get generalTheme {
  if (enableHotReloadTheme) {
    return _subThemes(_flexColorScheme());
  } else {
    _generalTheme ??= _subThemes(_flexColorScheme());
    return _generalTheme!;
  }
}

ThemeData _subThemes(FlexColorScheme flexColorScheme) {
  final themeData = flexColorScheme.toTheme;
  final colorScheme = flexColorScheme.toScheme;
  return themeData.copyWith(
      iconTheme: IconThemeData(color: colorScheme.primary, size: 24),
      appBarTheme: AppBarTheme(
          titleTextStyle: themeData.textTheme.displayLarge,
          iconTheme: IconThemeData(color: colorScheme.primary),
          centerTitle: false,
          color: colorScheme.surface),
      navigationBarTheme: NavigationBarThemeData(
          surfaceTintColor: colorScheme.surface,
          indicatorColor: DefinedColors._onBg1,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide),
      tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: themeData.textTheme.titleMedium,
          unselectedLabelColor: colorScheme.onPrimary),
      switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) return colorScheme.secondaryContainer;
            return colorScheme.onSurfaceVariant;
          }),
          thumbColor: MaterialStateProperty.resolveWith((states) => colorScheme.surface),
          splashRadius: 1),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: colorScheme.onSurfaceVariant,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: colorScheme.onSurfaceVariant,
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: colorScheme.onSurfaceVariant,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: colorScheme.error,
              )),
          errorStyle: themeData.textTheme.bodySmall?.copyWith(color: colorScheme.primaryContainer),
          hintStyle: themeData.textTheme.bodyMedium?.copyWith(color: colorScheme.primaryContainer)));
}

Widget secondaryElevatedButton(BuildContext context, {required void Function()? onPressed, required Widget child}) {
  return ElevatedButton(onPressed: onPressed, style: secondaryElevatedButtonStyle(context), child: child);
}

ButtonStyle secondaryElevatedButtonStyle(BuildContext context) {
  final theme = Theme.of(context);
  return ButtonStyle(
      textStyle: MaterialStateTextStyle.resolveWith((states) => theme.textTheme.titleMedium!),
      backgroundColor: MaterialStateProperty.all(theme.colorScheme.secondary),
      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(56))));
}

Widget primaryElevatedButton(BuildContext context, {required void Function()? onPressed, required Widget child}) {
  return ElevatedButton(onPressed: onPressed, style: primaryElevatedButtonStyle(context), child: child);
}

ButtonStyle primaryElevatedButtonStyle(BuildContext context) {
  final theme = Theme.of(context);
  return ButtonStyle(
      textStyle: MaterialStateTextStyle.resolveWith(
          (states) => theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.secondary)),
      backgroundColor: MaterialStateProperty.all(theme.colorScheme.primary),
      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(56))));
}
