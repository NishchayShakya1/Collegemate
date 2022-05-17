import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HackathonHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: deprecated_member_use
        "Hackathon!".text.xl5.bold.color(context.accentColor).make().px2(),
        // ignore: deprecated_member_use
      ],
    );
  }
}
