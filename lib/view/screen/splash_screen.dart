import 'package:flutter/material.dart';
import 'package:itr_app/view/screen/login_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  bool? isLoggedIn = false;
  late AnimationController animationController;
  late Animation<double> animation;

  void navigationPage() {
    if (isLoggedIn!) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
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

    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigationPage();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose(); // Dispose of the AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    'assets/images/loginimage.png',
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
