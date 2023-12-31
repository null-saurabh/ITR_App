import 'package:flutter/material.dart';

LinearGradient blueGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF3291E9), Color(0xFF5AB0FF)],
);


Color blackAndWhiteColor(ThemeMode mode) {
  return mode == ThemeMode.dark ? Colors.white : Colors.black;
}

Color greyAndWhiteColor(ThemeMode mode) {
  return mode == ThemeMode.dark ? Colors.white : Colors.grey;
}

Color homePageContainerColor(ThemeMode mode) {
  return mode == ThemeMode.dark ? const Color(0xFF313B42) : Colors.white;
}

String loginPageImage(ThemeMode mode) {
  return mode == ThemeMode.dark ? "assets/images/loginImageDark.png" : "assets/images/loginimage.png";
}

String homePageImage(ThemeMode mode) {
  return mode == ThemeMode.dark ? "assets/images/main_image_dark.png" : "assets/images/mainimage.png";
}

Color loginTextFieldColor(ThemeMode mode) {
  return mode == ThemeMode.dark ? const Color(0xFF283948) : const Color(0xFFd7e9f9);
}

Color selectPersonPageTitleColor(ThemeMode mode) {
  return mode == ThemeMode.dark ? Colors.white : const Color(0xFF364756);
}

Color selectPersonPageSubtitleColor(ThemeMode mode) {
  return mode == ThemeMode.dark ? const Color(0xFFE0E0E0) : const Color(0xFF4F687F);
}

Color paymentPageColor1(ThemeMode mode) {
  return mode == ThemeMode.dark ? Color(0xff293137) : const Color(0xff1B7FDB).withOpacity(0.05);
}

Color paymentPageColor2(ThemeMode mode) {
  return mode == ThemeMode.dark ? const Color(0xFF3D2E2E).withOpacity(0.9) : const Color(0xffCB3A3A).withOpacity(0.08);
}
LinearGradient gradientColor(ThemeMode mode) {
  if (mode == ThemeMode.dark) {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF293137), Color(0xFF293137)],
    );
  }
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF3291E9), Color(0xFF5AB0FF)],
  );
}

Color bottomSheetTextColor(ThemeMode mode) {
  return mode == ThemeMode.dark ? const Color(0xFFE0E0E0) : const Color(0xFF4F687F);
}

Color cardExtensionColor(ThemeMode mode) {
  return mode == ThemeMode.dark ? const Color(0xFF313B42) : const Color(0xFFF6FAFE);
}

Color orderStatusFailedTextColor(ThemeMode mode) {
  return mode == ThemeMode.dark ? const Color(0xffB3B3B3) : const Color(0xff455A64);
}

String horizontalLine(ThemeMode mode) {
  return mode == ThemeMode.dark ? "assets/images/horizontal_line_dark.png" : "assets/images/horizontal_line.png";
}

String uploadDocuments(ThemeMode mode) {
  return mode == ThemeMode.dark ? "assets/images/upload_document_dark.png" : "assets/images/upload_document.png";
}

String successImage(ThemeMode mode) {
  return mode == ThemeMode.dark ? "assets/images/success_dark.png" : "assets/images/success.png";
}

Color waitIconColor1(ThemeMode mode) {
  return mode == ThemeMode.dark ? const Color(0xff455A64) : const Color(0xffF4F4F4);
}
