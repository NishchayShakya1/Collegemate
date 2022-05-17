// import 'package:collegemate/widgets/GetInWidgets/google_signup_button_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';

// class SignUpWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.transparent,
//       // ),
//       backgroundColor: context.canvasColor,
//       body: SafeArea(
//           child: Material(
//         color: context.canvasColor,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Image.asset(
//                 "assets/images/splash.png",
//                 fit: BoxFit.cover,
//               ),
//               SizedBox(height: 15),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 5.0, horizontal: 32.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       HeightBox(15),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Container(
//                             margin: EdgeInsets.symmetric(horizontal: 5),
//                             width: 210,
//                             child: Text(
//                               ' Welcome to Collegemate!',
//                               style: TextStyle(
//                                 color: context.accentColor,
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             )),
//                       ),
//                       HeightBox(50),
//                       GoogleSigninButtonWidget(),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       )));
// }
