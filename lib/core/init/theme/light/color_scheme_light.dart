import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight get instance {
    _instance ??= ColorSchemeLight.init();
    return _instance!;
  }
  ColorSchemeLight.init();

  final Color bromn = Color(0xffa87e6f);
  final Color red = Color(0xffe57373);
  final Color green = Color(0xff8bc34a);
  final Color blue = Color(0xff64b5f6);
  final Color yellow = Color(0xffffc93c);
  final Color orange = Color(0xffffa726);
  final Color purple = Color(0xffba68c8);
  final Color pink = Color(0xfff06292);
  final Color grey = Color(0xff9e9e9e);
  final Color black = Color(0xff000000);
  final Color white = Color(0xffffffff);
  
  final Color azure = Color(0xff27928d);
}