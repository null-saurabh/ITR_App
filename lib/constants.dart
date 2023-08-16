import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



LinearGradient blueGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF3291E9), Color(0xFF5AB0FF)], // Example colors from earlier
  stops: [-0.0584, 0.9218],
  // transform: GradientRotation(344.71 * 3.14159 / 180),// Example stops
);





Color homePageContainerColor = Colors.white;
String loginPageImage = "assets/images/loginimage.png";
Color loginTextFieldColor =  const Color(0xFFd7e9f9);
Color selectPersonPageTitleColor =  const Color(0xFF364756);
Color selectPersonPageSubtitleColor =  const Color(0xFF4F687F);
LinearGradient appBarColor = blueGradient;
Color bottomSheetTextColor =Color(0xFF4F687F);
Color cardExtensionColor = Color(0xFF1B7FDB).withOpacity(0.12);


void colorsBasedOnTheme(ThemeMode themeMode) {
  if (themeMode == ThemeMode.dark){
    homePageContainerColor = const Color(0xFF313B42);
    loginPageImage = "assets/images/loginImageDark.png";
    loginTextFieldColor = const Color(0xFF283948);
    selectPersonPageTitleColor = Colors.white;
    selectPersonPageSubtitleColor =  const Color(0xFFE0E0E0 );
    appBarColor = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF293137),
        Color(0xFF293137),
      ],
    );
    bottomSheetTextColor =Color(0xFFE0E0E0);
    cardExtensionColor = Color(0xFF313B42);


  }
  else{
    homePageContainerColor = Colors.white;
    loginPageImage = "assets/images/loginimage.png";
    loginTextFieldColor = const Color(0xFFd7e9f9);
    selectPersonPageTitleColor =  const Color(0xFF364756);
    selectPersonPageSubtitleColor =  const Color(0xFF4F687F);
    appBarColor = blueGradient;
    bottomSheetTextColor =Color(0xFF4F687F);
    Color cardExtensionColor = Color(0xFF1B7FDB).withOpacity(0.12);


  }
}