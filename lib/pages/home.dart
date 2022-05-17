
import 'package:collegemate/pages/Home/home_page.dart';
import 'package:collegemate/provider/google_sign_in.dart';
import 'package:collegemate/widgets/GetInWidgets/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return HomePage();
              } else {
                return WelcomeScreen();
                // SignUpWidget();
              }
            },
          ),
        ),   
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          // SvgPicture.asset("assets/images/splash_bg.svg"),
          Center(child: CircularProgressIndicator()),
          
        ],
      );
}
