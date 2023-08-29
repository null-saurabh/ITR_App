import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itr_app/model/theme_data.dart';
import 'package:itr_app/view/screen/splash_screen.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:itr_app/view_model/provider/razorpay_provider.dart';
import 'package:itr_app/view_model/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
      MultiProvider(
          providers:[
            ChangeNotifierProvider(create: (_) => ThemeChanger()),
            ChangeNotifierProvider(create: (_) => ApiProvider()),
            ChangeNotifierProvider(create: (_) => RazorPayProvider()),
          ],
          child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, themeService, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeService.themeMode,
          home: const Splash(),
        );
      },
    );
  }
}
