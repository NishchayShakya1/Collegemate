import 'package:collegemate/widgets/GetInWidgets/google_signup_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // SvgPicture.asset("assets/images/splash_bg.svg"),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                children: [
                  // HeightBox(10),
                  Image.asset(
                    "assets/images/splash.png",
                  ),
                  HeightBox(10),
                  // As you can see we need more paddind on our btn

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 32.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // HeightBox(5),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                width: 210,
                                child: Text(
                                  ' Welcome to Collegemate!',
                                  style: TextStyle(
                                    color: context.accentColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                          HeightBox(50),
                          GoogleSigninButtonWidget(),
                        ],
                      ),
                    ),
                  )
                  // const SizedBox(height: defaultPadding),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
