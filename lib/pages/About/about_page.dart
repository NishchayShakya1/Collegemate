import 'dart:convert';

import 'package:collegemate/models/about.dart';
import 'package:collegemate/widgets/Aboutwidget/about_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
   @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(Duration(seconds: 0));
    var catalogJson3 =   await rootBundle.loadString("assets/files/about.json");
    var decodedData3 = jsonDecode(catalogJson3);
    var productsData3 = decodedData3["about"];
    AboutModel.items = List.from(productsData3)
        .map<About>((item) => About.fromMap(item))
        .toList();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: context.theme.canvasColor,
        body: SafeArea(
            bottom: false,
            child: Column(children: [
              Image.asset(
                "assets/images/about.png",
                fit: BoxFit.cover,
              ).h24(context).p24(),
              Expanded(
                  child: SingleChildScrollView(
                      child: VxArc(
                height: 12.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    padding: Vx.m4,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (AboutModel.items != null &&
                              AboutModel.items.isNotEmpty)
                            SingleChildScrollView(child: AboutList())
                          else
                            CircularProgressIndicator().centered()
                        ]),
                  ),
                ),
              )))
            ])));
  }
}
