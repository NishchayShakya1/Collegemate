// ignore_for_file: deprecated_member_use

import 'package:collegemate/local/localdb.dart';
import 'package:collegemate/provider/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:collegemate/local/constant.dart';

class GoogleSigninButtonWidget extends StatelessWidget {
  signinMethod(context) async{
     final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
             provider.login();
     constant.name = (await LocalDataSaver.getName());
     constant.email = await LocalDataSaver.getEmail();
     constant.img = await LocalDataSaver.getImg();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlineButton.icon(
          label: Text(
            'Continue With Google',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          highlightedBorderColor: Colors.white,
          borderSide: BorderSide(color: Colors.white),
          textColor: Colors.white,
          icon: FaIcon(FontAwesomeIcons.google, color: Colors.blue[400]),
          onPressed: () {
             signinMethod(context);
          },
        ),
      );
}
