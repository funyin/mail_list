import 'dart:math';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme();

  ThemeData get light => ThemeData(
      brightness: Brightness.light,
      fontFamily: "Aeonik",
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: false,
          titleTextStyle: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
          foregroundColor: Colors.black,
          elevation: 0),
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff2463EB),
          secondary: const Color(0xff2196F3),
          onSurface: const Color(0xff656565),
          surface: Colors.black,
          outline: const Color(0xffE0E0E0),
          surfaceVariant: Colors.black,
          background: Colors.black,
          onTertiary: Colors.black,
          onSecondary: Colors.black,
          onBackground: Colors.black),
      primaryColor: const Color(0xff2463EB),
      scaffoldBackgroundColor: const Color(0xffF9F9F9),
      textTheme: Typography.blackCupertino
          .apply(fontFamily: "Aeonik",bodyColor: const Color(0xff656565))
          .copyWith(bodySmall: const TextStyle(fontSize: 12)),
      buttonTheme: const ButtonThemeData(buttonColor: Color(0xff2463EB)),
      primarySwatch: generateMaterialColor(const Color(0xff2463EB)),
      hintColor: Colors.black.withOpacity(0.16),
      useMaterial3: false,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xff2463EB)))));

  MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: _tintColor(color, 0.9),
      100: _tintColor(color, 0.8),
      200: _tintColor(color, 0.6),
      300: _tintColor(color, 0.4),
      400: _tintColor(color, 0.2),
      500: color,
      600: _shadeColor(color, 0.1),
      700: _shadeColor(color, 0.2),
      800: _shadeColor(color, 0.3),
      900: _shadeColor(color, 0.4),
    });
  }

  Color _tintColor(Color color, double factor) => Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1);

  int _tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  int _shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      _shadeValue(color.red, factor),
      _shadeValue(color.green, factor),
      _shadeValue(color.blue, factor),
      1);
}
