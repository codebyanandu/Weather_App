import 'package:flutter/material.dart';
import 'package:weather_app/app/utils/colors.dart';

class ATheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AColors.white,
    appBarTheme: AppBarTheme(color: AColors.primaryClr),
  );

  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}