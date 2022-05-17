import 'dart:async';

import 'package:collegemate/pages/OnBoarding/onBoarding.dart';
import 'package:collegemate/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class SplashScreen extends StatefulWidget {
   final bool showHome;
  const SplashScreen({
    Key key,
    @required this.showHome,

  }):super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
  
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => widget.showHome? Home() : OnboardingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here
            Image.asset(
              'assets/images/splash.png',
              height: 120,
            ),
            SizedBox(
              height: 20,
            ),
            // CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            // )
          ],
        ),
      ),
    );
  }
}