

import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight get instance {
    _instance ??= TextThemeLight.init();
    return _instance!;
  }
  TextThemeLight.init();

  final TextStyle? displayLarge = TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xff8bc34a));
  final TextStyle? displayMedium = TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xff8bc34a));
  final TextStyle? displaySmall = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff8bc34a));
  final TextStyle? headlineLarge = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff8bc34a));
  final TextStyle? headlineMedium = TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff8bc34a));
  final TextStyle? headlineSmall = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff8bc34a));
  final TextStyle? titleLarge = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff8bc34a));
  final TextStyle? titleMedium = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff8bc34a));
  final TextStyle? titleSmall = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff8bc34a));
  final TextStyle? bodyLarge = TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Color(0xff8bc34a));
  final TextStyle? bodyMedium = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xff8bc34a));
  final TextStyle? bodySmall = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xff8bc34a));
  final TextStyle? labelLarge = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xff8bc34a));
  final TextStyle? labelSmall = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xff8bc34a));
}