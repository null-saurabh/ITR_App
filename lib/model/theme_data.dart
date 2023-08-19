import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  canvasColor: Colors.white,
  fontFamily: "Roboto",
  cardColor: Colors.white,
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.grey)),
  colorScheme: const ColorScheme.light(
    primary: Colors.white,
    secondary: Colors.white,
    tertiary: Colors.blue,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff48a2f5)),
      minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
    ),
  ),
);

final ThemeData darkTheme = lightTheme.copyWith(
  brightness: Brightness.dark,
  canvasColor: const Color(0xFF293137),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
  ),
  cardColor: const Color(0xFF293137),
inputDecorationTheme: const InputDecorationTheme(
hintStyle: TextStyle(color: Colors.white70)),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF293137),
    secondary: Colors.black,
    tertiary: Color(0xFF293137),
  ),
);
