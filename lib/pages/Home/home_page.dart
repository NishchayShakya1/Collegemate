// ignore_for_file: deprecated_member_use

import 'package:collegemate/pages/Home/Contestdemo.dart';
import 'package:collegemate/pages/Home/Hackathondemo.dart';
import 'package:collegemate/pages/Home/Internshipdemo.dart';
import 'package:collegemate/pages/Home/Scholarshipdemo.dart';
import 'package:collegemate/provider/google_sign_in.dart';
import 'package:collegemate/widgets/Home_Components/doubleback_to_close_widget.dart';
import 'package:collegemate/widgets/Home_Components/drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:helloflutter/core/store.dart';
// import 'package:helloflutter/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
// import '../Cart/cart_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final screens = [
    Contestdemo(),
    Hackathondemo(),
    Internshipdemo(),
    Scholarshipdemo()
  ];

//  final url = "https://collegemateapp.herokuapp.com/shareurl";
  // final urlfaq = "https://cashitoutapp.herokuapp.com/faq";
  // final urlabout = "https://cashitoutapp.herokuapp.com/about";
  // final urlprivacy = "https://cashitoutapp.herokuapp.com/privacy";
  // final urlshareurl = "https://cashitoutapp.herokuapp.com/shareurl";
  // @override
  // void initState() {
  // ignore: todo
  //
  //   super.initState();
  //   loadData();
  // }

  //loadData() async {
  //  await Future.delayed(Duration(seconds: 2));
  //   var response = await http.get(Uri.parse(url));
  //   var catalogJson = response.body;
  //   var decodedData = jsonDecode(catalogJson);
  //   var productsData = decodedData["shareurl"];
  //   UrlModel.items = List.from(productsData)
  ///       .map<Url>((item) => Url.fromMap(item))
  //      .toList();

  //    setState(() {});

  // }

  @override
  Widget build(BuildContext context) {
    // final _cart = (VxState.store as Mystore).cart;
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    final items = <Widget>[
      Icon(
        CupertinoIcons.chevron_left_slash_chevron_right,
        size: 30,
      ),
      Icon(
        Icons.groups_sharp,
        size: 30,
      ),
      Icon(
        Icons.work_sharp,
        size: 30,
      ),
      Icon(
        Icons.school_sharp,
        size: 30,
      ),

      // Icon(
      //   Icons.person,
      //   size: 30,
      // ),
    ];
    return SafeArea(
      top: false,
      child: ClipRect(
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            backgroundColor: context.canvasColor,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () async {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.logout();
                      //  final Prefs = await SharedPreferences.getInstance();
                      //  Prefs.setBool('showHome', false);
                      //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> OnboardingPage() ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 13),
                      child: DecoratedIcon(
                        Icons.logout,
                        color: context.accentColor,
                        size: 28.0,
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
                  )),
            ],
          ),
          bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(color: context.accentColor)),
              child: CurvedNavigationBar(
                color: context.cardColor,
                backgroundColor: Colors.transparent,
                height: 50,
                animationCurve: Curves.easeInOutSine,
                animationDuration: Duration(milliseconds: 300),
                index: index,
                items: items,
                onTap: (index) => setState(() => this.index = index),
              )),
          backgroundColor: context.canvasColor,
          // floatingActionButton: VxBuilder(
          //   mutations: {AddMutation, RemoveMutation},
          //   builder: (ctx, _, mut) => FloatingActionButton(
          //     onPressed: () => Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => CartPage()),
          //     ), //Navigator.pushNamed(context, MyRoutes.cartRoute),

          //     // ignore: deprecated_member_use
          // backgroundColor: context.theme.buttonColor,
          // child: Icon(CupertinoIcons.cart_fill, color: Colors.white),
          // ).badge(
          //     position: VxBadgePosition.rightTop,
          //     color: Vx.gray200,
          //     size: 20,
          //     count: _cart.items.length,
          //     textStyle:
          //         TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          // ),

          // floatingActionButton: FloatingActionButton(
          // onPressed: () {
          //   _launchURL();
          // },
          //   backgroundColor: context.theme.buttonColor,
          //   child: Icon(Icons.share_sharp, color: Colors.white),
          // ),

          body: DoubleBackToCloseWidget(child: screens[index]
              // SafeArea(
              //   child: Container(
              //     padding: Vx.m16,
              //     child:
              //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //       CatalogHeader(),
              //       if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              //         CatalogList().expand()
              //       else
              //         CircularProgressIndicator().centered().py16().expand(),
              //     ]),
              //   ),
              // ),
              ),
          drawer: MyDrawer(),
        ),
      ),
    );
  }
}

//deleted
// appBar: AppBar(title: Text("Catalog App")),
// body: Padding(
// padding: const EdgeInsets.all(16.0),
//   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//       ? GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//           ),
//           itemBuilder: (context, index) {
//             final item = CatalogModel.items[index];
//             return Card(
//                 clipBehavior: Clip.antiAlias,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 child: GridTile(
//                   header: Container(
//                     child: Center(
//                       child: Text(
//                         item.name,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(color: Colors.deepPurple),
//                   ),
//                   child: Image.asset(item.image),
//                   footer: Text(item.price.toString()),
//                 ));
//           },
//           itemCount: CatalogModel.items.length,
//         )
//       : Center(
//           child: CircularProgressIndicator(),
//         ),
// ),
// drawer: MyDrawer(),
