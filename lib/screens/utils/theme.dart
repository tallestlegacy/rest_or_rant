import 'package:flutter/material.dart';

ThemeData getTheme() {
  const primaryColor = Colors.amber;

  return ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 1,
      surfaceTintColor: primaryColor,
      shadowColor: Colors.grey,
    ),
    inputDecorationTheme: const InputDecorationTheme(fillColor: primaryColor),
  );
}
