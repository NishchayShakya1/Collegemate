import 'package:collegemate/Pojo/InternResponse.dart';
import 'package:collegemate/Pojo/Internship.dart';
import 'package:collegemate/api/internapiservice.dart';
import 'package:collegemate/widgets/internshipwidget/internship_header.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class Internshipdemo extends StatefulWidget {
  @override
  _InternshipdemoState createState() => _InternshipdemoState();
}

class _InternshipdemoState extends State<Internshipdemo> {
  InternshipApiServiceProvider _apiServiceProvider =
      new InternshipApiServiceProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: Vx.m12,
        child: FutureBuilder<InternshipResponse>(
          future: _apiServiceProvider.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Internship> list = snapshot.data.internship;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InternshipHeader(),
                  Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 0),
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            Internship user = list[index];
                            // final catalog = CatalogModel.getbyPosition(index);
                            return VxBox(
                                    child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ButtonBar(
                                  alignment: MainAxisAlignment.spaceBetween,
                                  buttonPadding: Vx.m8,
                                  children: [
                                    // Hero(
                                    //   tag: Key("${data1[index]['id']}"
                                    //       .toString()),
                                    //   child: CatalogImage(
                                    //     image: "${data1[index]['image']}",
                                    //     key: null,
                                    //   ),
                                    // ),
                                    user.website.text.make(),
                                    GestureDetector(
                                      onTap: () async {
                                        var url = user.link;
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw "Could not launch $url";
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 0),
                                        child: DecoratedIcon(
                                          Icons.link_sharp,
                                          color: context.accentColor,
                                          size: 24.0,
                                          shadows: [
                                            BoxShadow(
                                              blurRadius: 42.0,
                                              color: Colors.purpleAccent,
                                            ),
                                            BoxShadow(
                                              blurRadius: 12.0,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ).pOnly(right: 3.0),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(padding: EdgeInsets.symmetric()),
                                    user.name.text.lg.xl
                                        .color(context.accentColor)
                                        .bold
                                        .make()
                                        .px8()
                                        .py8(),
                                    user.startDate.text
                                        .textStyle(
                                          context.captionStyle,
                                        )
                                        .make()
                                        .px8()
                                        .py2(),
                                    user.endDate.text
                                        .textStyle(
                                          context.captionStyle,
                                        )
                                        .make()
                                        .px8(),
                                  ],
                                ))
                              ],
                            ).p12())
                                .color(context.cardColor)
                                .roundedLg
                                .square(200)
                                .make()
                                .py8()
                                .px0();
                          })),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    ));
  }
}
