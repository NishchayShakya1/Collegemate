// ignore_for_file: deprecated_member_use

import 'package:collegemate/models/about.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: AboutModel.items.length,
        itemBuilder: (context, index) {
          final about = AboutModel.items[index];
          // final catalog = CatalogModel.getbyPosition(index);
          return AboutItem(about: about).py2(); //InkWell(
          // onTap: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => HomeDetailPage(catalog: catalog
          //             //CatalogModel.getById(2)
          //             ))),
          // child: AboutItem(about: about));
        });
  }
}

class AboutItem extends StatelessWidget {
  final About about;

  const AboutItem({Key key, this.about})
      : assert(about != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        about.l.text.textStyle(context.captionStyle).make().py0().px8(),
      ],
    ).py12();
  }
}
