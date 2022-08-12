// import 'dart:convert';

// import 'package:ecommerce/model/CateProducts.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce/model/Product.dart';
// import 'package:http/http.dart' as http;

// import 'package:provider/provider.dart';
// import 'package:ecommerce/providers/favorites_counter.dart';
// import 'package:ecommerce/providers/Items_fetch.dart';
// import 'package:ecommerce/model/Favorite.dart';

// class ItemsFromCategory extends StatefulWidget {
//   ItemsFromCategory();
    

//   @override
//   State<ItemsFromCategory> createState() => _ItemsWidgetState();
// }

// class _ItemsWidgetState extends State<ItemsFromCategory> {
//   @override
//   Widget build(BuildContext context) {
//     // productList = [...context.watch<ItemsFecth>().count];
//     return widget.theProduct.isEmpty
//         ? Center(child: CircularProgressIndicator())
//         : GridView.count(
//             childAspectRatio: 0.67,
//             physics: NeverScrollableScrollPhysics(),
//             // crossAxisSpacing: 2,
//             // mainAxisSpacing: 2,
//             crossAxisCount: 2,
//             shrinkWrap: true,
//             children: [
//               for (int i = 0; i < widget.theProduct.length; i++)
//                 Container(
//                   padding: EdgeInsets.only(left: 10, right: 10, top: 10),
//                   margin: EdgeInsets.all(7),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Column(children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(5),
//                           decoration: BoxDecoration(
//                               color: Color(0xFF4c53A5),
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Text(
//                             "-50%",
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Spacer(),
//                         InkWell(
//                             onTap: (() {}),
//                             child: Icon(
//                               Icons.favorite_outline,
//                               size: 25,
//                               color: Colors.red,
//                             ))
//                       ],
//                     ),
//                     Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         customBorder: CircleBorder(),
//                         splashColor: Color(0xFF4c53a5),
//                         onTap: () => {
//                           Future.delayed(const Duration(milliseconds: 200), () {
//                             Navigator.pushNamed(context, "/product",
//                                 arguments: {
//                                   "name": widget.theProduct[i].name,
//                                   "thumbnail": widget.theProduct[i].thumbnail,
//                                   "description":
//                                       widget.theProduct[i].description,
//                                   "price": widget.theProduct[i].price
//                                 });
//                           })
//                         },
//                         child: Container(
//                           padding: EdgeInsets.only(top: 10),
//                           child: Image(
//                             image: NetworkImage(widget.theProduct[i].thumbnail),
//                             height: 100,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     Container(
//                         padding: EdgeInsets.only(top: 10),
//                         alignment: Alignment.centerLeft,
//                         child: RichText(
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             strutStyle: StrutStyle(fontSize: 15.0),
//                             text: TextSpan(
//                                 style: const TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xFF4c53a5)),
//                                 text: widget.theProduct[i].name!))),
//                     Container(
//                         padding: EdgeInsets.only(top: 5),
//                         alignment: Alignment.centerLeft,
//                         child: RichText(
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             strutStyle: StrutStyle(fontSize: 12.0),
//                             text: TextSpan(
//                                 style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Color.fromARGB(255, 119, 119, 119)),
//                                 text: widget.theProduct[i].description!))),
//                     Expanded(child: Container()),
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "\$${widget.theProduct[i].price!}",
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 color: Color(0xFF4c53A5),
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Icon(
//                             Icons.add_shopping_cart_sharp,
//                             size: 25,
//                             color: Color(0xFF4c53A5),
//                           )
//                         ],
//                       ),
//                     )
//                   ]),
//                 )
//             ],
//           );
//   }
// }
