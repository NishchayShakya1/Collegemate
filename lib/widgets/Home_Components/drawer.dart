// ignore_for_file: deprecated_member_use
import 'package:collegemate/local/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collegemate/local/localdb.dart';
import 'package:collegemate/pages/About/about_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../pages/About/aboutme.dart';

//import 'package:http/http.dart' as http;
class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  signInMethod() async {
    constant.name = (await LocalDataSaver.getName());
    constant.email = await LocalDataSaver.getEmail();
    constant.img = await LocalDataSaver.getImg();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    // final imageUrl = "https://avatars.githubusercontent.com/u/75979530?v=4";
    return Drawer(
      child: Container(
        color: context.theme.canvasColor,
        child: ListView(
          //padding: EdgeInsets.zero,

          children: [
            HeightBox(25),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: user.photoURL,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                user.displayName,
                style: TextStyle(color: context.theme.accentColor),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                user.email,
                style: TextStyle(color: context.theme.accentColor),
              ),
            ),
            Divider(),
            HeightBox(5),
            // if (condition)
            //   Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //     child: Text(
            //       'Email: ' + user.email,
            //       style: TextStyle(color: Colors.white),
            //       textAlign: TextAlign.start,
            //     ),
            //   ),

            // if (user.photoURL != null)
            // DrawerHeader(
            //   padding: EdgeInsets.zero,
            //   child: UserAccountsDrawerHeader(
            //     decoration: BoxDecoration(color: context.theme.canvasColor),
            //     margin: EdgeInsets.zero,
            //     accountName: Text(
            //       user.displayName,
            //       style: TextStyle(color: context.theme.accentColor),
            //     ),
            //     accountEmail: Text(user.email,
            //         style: TextStyle(color: context.theme.accentColor)),
            //     // currentAccountPicture: CircleAvatar(
            //     //    backgroundImage: NetworkImage(user.photoURL),

            //     // ),
            //   ),
            // ),

            // Card(
            // shape: StadiumBorder(),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10.0),
            //    ),
            //   child:
            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: ListTile(
            //     onTap: () async {
            //       var url = uri;
            //       if (await canLaunch(url)) {
            //         await launch(url);
            //       } else {
            //         throw "Could not launch $url";
            //       }
            //     },
            //     leading:
            //         Icon(Icons.share_sharp, color: context.theme.accentColor),
            //     //network

            //     title: "Share".text.color(context.accentColor).xl2.make(),
            //   ),
            // ),
            //  ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
                leading:
                    Icon(Icons.info_outline, color: context.theme.accentColor),
                title: "About App".text.color(context.accentColor).xl2.make(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                leading:
                    Icon(CupertinoIcons.profile_circled, color: context.theme.accentColor),
                title: "About Me".text.color(context.accentColor).xl2.make(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () async {
                  const urlPreview =
                      'https://play.google.com/store/apps/details?id=com.nishchayshakya.collegemate';
                  await Share.share(
                      'Explore Coding Contests, Hackathons, Internships, and Scholarships\n\nDownload the App Now ↓\n\n$urlPreview');
                },
                leading: Icon(Icons.share, color: context.theme.accentColor),
                title: "Share".text.color(context.accentColor).xl2.make(),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: ListTile(
            //     onTap: () {
            //       Navigator.of(context).pop();
            //     },
            //     leading: Icon(Icons.share, color: context.theme.accentColor),
            //     //network

            //     title: "Share".text.color(context.accentColor).xl2.make(),
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   child: ButtonBar(
            //     alignment: MainAxisAlignment.start,
            //     buttonPadding: Vx.mV2,
            //     children: [
            //       Icon(Icons.money_sharp, color: context.theme.accentColor),
            //       WidthBox(15),
            // FlatButton(
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            //   child: "Tokens".text.color(context.accentColor).xl2.make(),
            // )
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   child: ButtonBar(
            //     alignment: MainAxisAlignment.start,
            //     buttonPadding: Vx.mV2,
            //     children: [
            //       Icon(Icons.account_balance_wallet_sharp,
            //           color: context.theme.accentColor),
            //       WidthBox(15),
            // FlatButton(
            //   onPressed: () {},
            //   child:
            //       "My Tokens".text.color(context.accentColor).xl2.make(),
            // )
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   child: ButtonBar(
            //     alignment: MainAxisAlignment.start,
            //     buttonPadding: Vx.mV2,
            //     children: [
            //       Icon(Icons.support_agent_sharp,
            //           color: context.theme.accentColor),
            //       WidthBox(15),
            //       FlatButton(
            //         onPressed: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => ContactPage()),
            //           );
            //         },
            //         child:
            //             "Assistance".text.color(context.accentColor).xl2.make(),
            //       )
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   child: ButtonBar(
            //     alignment: MainAxisAlignment.start,
            //     buttonPadding: Vx.mV2,
            //     children: [
            //       Icon(Icons.info_outline, color: context.theme.accentColor),
            //       WidthBox(15),
            //       FlatButton(
            //         onPressed: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => AboutPage()),
            //           );
            //         },
            //         child:
            //             "About App".text.color(context.accentColor).xl2.make(),
            //       )
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   child: ButtonBar(
            //     alignment: MainAxisAlignment.start,
            //     buttonPadding: Vx.mV2,
            //     children: [
            //       Icon(Icons.privacy_tip_outlined,
            //           color: context.theme.accentColor),
            //       WidthBox(15),
            //       FlatButton(
            //         onPressed: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => PrivacyPage()),
            //           );
            //         },
            //         child: "Privacy Policy"
            //             .text
            //             .color(context.accentColor)
            //             .xl2
            //             .make(),
            //       )
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   child: ButtonBar(
            //     alignment: MainAxisAlignment.start,
            //     buttonPadding: Vx.mV2,
            //     children: [
            //       Icon(Icons.question_answer_sharp,
            //           color: context.theme.accentColor),
            //       WidthBox(5),
            //       FlatButton(
            //         onPressed: () {
            //             Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => FaqPage()),
            //           );
            //         },
            //         child: "FAQ".text.color(context.accentColor).xl2.make(),
            //       )
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   child: ButtonBar(
            //     alignment: MainAxisAlignment.start,
            //     buttonPadding: Vx.mV2,
            //     children: [
            //       Icon(Icons.reviews_outlined,
            //           color: context.theme.accentColor),
            //       WidthBox(15),
            //       FlatButton(
            //         onPressed: () {},
            //         child:
            //             "Review Us".text.color(context.accentColor).xl2.make(),
            //       )
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   child: ButtonBar(
            //     alignment: MainAxisAlignment.start,
            //     buttonPadding: Vx.mV2,
            //     children: [
            //       Icon(Icons.share, color: context.theme.accentColor),
            //       WidthBox(15),
            //       FlatButton(
            //         onPressed: () {},
            //         child: "Share".text.color(context.accentColor).xl2.make(),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// _launchURL() async {
//   final url = "https://www.linkedin.com/in/nishchayshakya/";
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
