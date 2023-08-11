import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itr_app/model/theme_data.dart';
import 'package:itr_app/view/screen/login_page.dart';
import 'package:itr_app/view/screen/otp_page.dart';
import 'package:itr_app/view/screen/splash_screen.dart';
import 'package:itr_app/view_model/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
      MultiProvider(
          providers:[
            ChangeNotifierProvider(create: (_) => ThemeChanger())
          ],
          child: const MyApp()));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeNotifier = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:Provider.of<ThemeChanger>(context).themeMode,
      home: const OtpPage(),
    );
  }
}
