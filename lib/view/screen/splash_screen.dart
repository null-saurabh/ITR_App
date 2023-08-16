import 'dart:async';
import 'package:flutter/material.dart';
import 'package:itr_app/view/screen/homepage.dart';
import 'package:itr_app/view/screen/login_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  bool? isLoggedIn = false;
  late AnimationController animationController;
  late Animation<double> animation;



  startTime() async {
    // var sharedPref = await SharedPreferences.getInstance();
    // isLoggedIn = sharedPref.getBool('onBoard');
    var duration = const Duration(milliseconds: 2500);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    if (isLoggedIn!) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();
    setState(() {});
    startTime();
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
              Image.asset(
                'assets/images/loginimage.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
