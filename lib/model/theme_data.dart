import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  canvasColor: Colors.white,
  fontFamily: "Roboto",
  colorScheme: const ColorScheme.light(
    primary: Colors.white,
    secondary: Colors.white,
    tertiary: Colors.blue

  ),
  elevatedButtonTheme: ElevatedButtonThemeData(

    style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff48a2f5)),
      minimumSize: MaterialStateProperty.all(Size(double.infinity, 50))
    )
  )
);


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: "Roboto",
  canvasColor: const Color(0xFF293137),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF293137),
    secondary: Colors.black,
    tertiary: (Color(0xFF293137)),
  ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff48a2f5)),
            minimumSize: MaterialStateProperty.all(Size(double.infinity, 50))
        )
    )


);