import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/homepage.dart';
import 'package:itr_app/view/screen/login_page.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  late bool isLoggedIn;
  late AnimationController animationController;
  late Animation<double> animation;
  late Future<void> initFuture;

  void navigationPage() {
    isLoggedIn = Provider.of<ApiProvider>(context, listen: false).isLoggedIn;
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    initFuture = Future.wait([
      animationController.forward(),
      Provider.of<ApiProvider>(context, listen: false).loadTokenFromStorage()
    ]).then((value) => navigationPage());

    // // animationController.forward();
    // animationController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     navigationPage();
    //   }
    // });
  }

  @override
  void dispose() {
    animationController.dispose(); // Dispose of the AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      // backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: animation,
                builder: (BuildContext context, Widget? child) {
                  return Image.asset(
                    loginPageImage(themeMode),
                    width: animation.value * 250,
                    height: animation.value * 250,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
