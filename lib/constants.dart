import 'package:flutter/material.dart';



LinearGradient blueGradient = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xFF3291E9), Color(0xFF5AB0FF)], // Example colors from earlier
  stops: [-0.0584, 0.9218],
  transform: GradientRotation(344.71 * 3.14159 / 180),// Example stops
);





Color homePageContainerColor = Colors.white;
String loginPageImage = "assets/images/loginimage.png";
Color loginTextFieldColor =  Color(0xFFd7e9f9);


void colorsBasedOnTheme(ThemeMode themeMode) {
  if (themeMode == ThemeMode.dark){
    homePageContainerColor = Color(0xFF313B42);
    loginPageImage = "assets/images/loginImageDark.png";
    loginTextFieldColor = Color(0xFF283948);
  }
  else{
    homePageContainerColor = Colors.white;
    loginPageImage = "assets/images/loginimage.png";
    loginTextFieldColor = Color(0xFFd7e9f9);
  }
}