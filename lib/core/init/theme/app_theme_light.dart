import 'package:flutter/material.dart';
import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;

  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme(),
        textTheme: _appTextTheme(),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
        ),
        scaffoldBackgroundColor: Color(0xfff1f3f8),
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
        tabBarTheme: _appTabBarTheme(),
      );

  TabBarTheme _appTabBarTheme() {
    return TabBarTheme(
        unselectedLabelStyle: textThemeLight!.bodyMedium!.copyWith(
          color: colorSchemeLight!.black,
        ),
      );
  }

  TextTheme _appTextTheme() {
    return TextTheme(
        displayLarge: textThemeLight!.displayLarge,
        displayMedium: textThemeLight!.displayMedium,
        displaySmall: textThemeLight!.displaySmall,
        headlineLarge: textThemeLight!.headlineLarge,
        headlineMedium: textThemeLight!.headlineMedium,
        headlineSmall: textThemeLight!.headlineSmall,
        titleLarge: textThemeLight!.titleLarge,
        titleMedium: textThemeLight!.titleMedium,
        titleSmall: textThemeLight!.titleSmall,
        bodyLarge: textThemeLight!.bodyLarge,
        bodyMedium: textThemeLight!.bodyMedium,
        bodySmall: textThemeLight!.bodySmall,
        labelLarge: textThemeLight!.labelLarge,
        labelSmall: textThemeLight!.labelSmall,
      );
  }

  ColorScheme _appColorScheme () {
    return ColorScheme(
      primary: colorSchemeLight!.blue,
      secondary: colorSchemeLight!.white,
      surface: colorSchemeLight!.yellow,
      error: colorSchemeLight!.green,
      onPrimary: colorSchemeLight!.orange,
      onSecondary: colorSchemeLight!.black,
      onSurface: colorSchemeLight!.azure,
      onError: colorSchemeLight!.orange,
      brightness: Brightness.light,
    );
  }
}
