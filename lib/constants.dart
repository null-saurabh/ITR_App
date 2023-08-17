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
String horizontalLine = "assets/images/horizontal_line.png";
String uploadDocuments = "assets/images/upload_document.png";
String success = "assets/images/success.png";
Color loginTextFieldColor =  const Color(0xFFd7e9f9);
Color selectPersonPageTitleColor =  const Color(0xFF364756);
Color selectPersonPageSubtitleColor =  const Color(0xFF4F687F);
late LinearGradient gradientColor;
Color bottomSheetTextColor =Color(0xFF4F687F);
Color cardExtensionColor = Color(0xFF1B7FDB);
Color orderStatusFailedTextColor = Color(0xff455A64);
Color waitIconColor1 = Color(0xffF4F4F4);


void colorsBasedOnTheme(ThemeMode themeMode) {
  if (themeMode == ThemeMode.dark){
    homePageContainerColor = const Color(0xFF313B42);
    loginPageImage = "assets/images/loginImageDark.png";
    loginTextFieldColor = const Color(0xFF283948);
    selectPersonPageTitleColor = Colors.white;
    selectPersonPageSubtitleColor =  const Color(0xFFE0E0E0 );
    gradientColor = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF293137),
        Color(0xFF293137),
      ],
    );
    bottomSheetTextColor =Color(0xFFE0E0E0);
    cardExtensionColor = Color(0xFF313B42);
    success = "assets/images/success_dark.png";
    horizontalLine = "assets/images/horizontal_line_dark.png";
    uploadDocuments = "assets/images/upload_document_dark.png";
    orderStatusFailedTextColor = Color(0xffB3B3B3);
    waitIconColor1 = Color(0xff455A64);

  }
  else{
    homePageContainerColor = Colors.white;
    loginPageImage = "assets/images/loginimage.png";
    loginTextFieldColor = const Color(0xFFd7e9f9);
    selectPersonPageTitleColor =  const Color(0xFF364756);
    selectPersonPageSubtitleColor =  const Color(0xFF4F687F);
    gradientColor = blueGradient;
    bottomSheetTextColor =Color(0xFF4F687F);
    cardExtensionColor = Color(0xFFF6FAFE);
    orderStatusFailedTextColor = Color(0xff455A64);
    horizontalLine = "assets/images/horizontal_line.png";
    uploadDocuments = "assets/images/upload_document.png";
    success = "assets/images/success.png";
    waitIconColor1 = Color(0xffF4F4F4);

  }
}