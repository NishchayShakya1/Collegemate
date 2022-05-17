// ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:helloflutter/core/store.dart';
// import 'package:helloflutter/models/cart.dart';

// import 'package:helloflutter/widgets/cartwidgets/cart_button.dart';
// import 'package:velocity_x/velocity_x.dart';

// class CartPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: context.canvasColor,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           title: "Cart".text.make(),
//         ),
//         body: Container(
//           child: Column(
//             //   crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CheckOut(),
//               _CartList().p8().expand(),
//               CartButton(),
//               Divider(),
//               _CartTotal(),
//             ],
//           ),
//         ));
//   }
// }

// class _CartTotal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final CartModel _cart = (VxState.store as Mystore).cart;
//     return SizedBox(
//       height: 40,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           VxBuilder(
//             mutations: {RemoveMutation},
//             builder: (context, _, mut) {
//               return "\₹${_cart.totalPrice}"
//                   .text
//                   .xl4
//                   .color(context.theme.accentColor)
//                   .make();
//             },
//           ),

          // 30.widthBox,
          // ElevatedButton(
          //         onPressed: () {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: "Buying not Supported Yet"
          //       .text
          //       .color(context.theme.accentColor)
          //       .align(TextAlign.center)
          //       .make(),
          //   backgroundColor: context.theme.canvasColor,
          // ));
          //         },
          //         style: ButtonStyle(
          //             backgroundColor:
          //                 MaterialStateProperty.all(context.theme.buttonColor)),
          //         child: "Buy".text.white.make())
          //     .w32(context)
//         ],
//       ),
//     );
//   }
// }

// class _CartList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     VxState.watch(context, on: [RemoveMutation]);
//     final CartModel _cart = (VxState.store as Mystore).cart;
//     return _cart.items.isEmpty
//         ? "Nothing To Show".text.xl3.makeCentered()
//         : ListView.builder(
//             itemCount: _cart.items?.length,
//             itemBuilder: (context, index) => ListTile(
//               leading:
//                   Image.asset("assets/images/rupee.png"), //Icon(Icons.done),
//               trailing: IconButton(
//                   icon: Icon(Icons.remove_circle_outline),
//                   onPressed: () => RemoveMutation(_cart.items[index])
//                   // setState(() {});
//                   ),
//               title: _cart.items[index].name.text.xl.make(),
//             ),
//           );
//   }
// }

// class MaterialButton extends StatefulWidget {

//   final String passedColorName;
//   const MaterialButton({Key key, this.passedColorName})
//       : super(key: key);
//   @override
//   _MaterialButtonState createState() => _MaterialButtonState(passedColorName: this.passedColorName);
// }

// class _MaterialButtonState extends State<MaterialButton> {
//   Color passedColor;
//   String passedColorName;
//   _MaterialButtonState({this.passedColorName});
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: context.theme.buttonColor, //  changeButton ? Colors.green[400] :
//       borderRadius: BorderRadius.circular(50), //hangeButton ?
//       child: InkWell(
//         onTap: () {if(passedColorName != null)
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => UPIPage()),
//           );
//         },
//         child: AnimatedContainer(
//           duration: Duration(seconds: 1),
//           width: 115, //changeButton ? 50
//           height: 42,
//           alignment: Alignment.center,
//           child: Text(
//             "Buy",
//             style: TextStyle(
//                 color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CheckOut extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 48,
//         child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//           "Check Out!".text.color(context.theme.accentColor).xl5.bold.make()
//         ])).px32().py12();
//   }
// }
