import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [buildTop(), buildContent(context)],
      ),
    );
  }

  Widget buildContent(BuildContext context) => Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'Nishchay Shakya',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Flutter Developer',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.instagram,
                  "https://www.instagram.com/nishchayshakyaa/"),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.github,
                  "https://github.com/NishchayShakya1"),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.twitter,
                  "https://twitter.com/nishchayshakyaa"),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.linkedin,
                  "https://www.linkedin.com/in/nishchayshakya/"),
            ],
          ),
          // const Divider(),
          const SizedBox(height: 30),
          // buildAbout(),
          // const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: glassMorphism(context),
          ),
          const SizedBox(height: 16),
        ],
      );

  Widget buildSocialIcon(IconData icon, String url) => CircleAvatar(
        radius: 25,
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              // ignore: deprecated_member_use
              if (await canLaunch(url)) {
                // ignore: deprecated_member_use
                await launch(url);
              } else {
                throw "Could not launch $url";
              }
            },
            child: Center(child: Icon(icon, size: 25)),
          ),
        ),
      );

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Text(
              'About',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Sophomore at Indian Institute of Information Technology Kota.\n\nTrying to help more & more people by making Easy to Use Apps using Flutter Framework.',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      );

  Widget glassMorphism(BuildContext context) => Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 24,
              spreadRadius: 2,
              color: Colors.black.withOpacity(0.2))
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                      width: 1, color: Colors.white.withOpacity(0.2))),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sophomore at Indian Institute of Information Technology Kota.\n\nTrying to help more & more people by making Easy to Use Apps using Flutter Framework.',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(top: top, child: buildProfileImage()),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          "assets/images/Dart.png",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const AssetImage("assets/images/profile.jpeg"),
      );
}
