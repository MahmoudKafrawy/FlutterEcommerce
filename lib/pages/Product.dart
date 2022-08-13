import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widgets/ProductAppBar.dart';
import 'package:ecommerce/providers/Cart_counter.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<Color> clrs = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.orange
  ];
  List isInCart = [];

  sendCart(id) {
    context.read<CartCounter>().addToCartPage(id);
    print(id);
    setState(() {});
  }

  removeCart(id) {
    context.read<CartCounter>().removeFromCartPage(id);
    print(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    isInCart = [...context.watch<CartCounter>().isinCart];
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
        body: Column(children: [
      Container(
        padding: EdgeInsets.only(top: 15),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 0),
          child: Row(
            children: [
              InkWell(
                onTap: () => {Navigator.pop(context)},
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Color(0xFF4c53a5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Prdouct",
                  style: TextStyle(
                      fontSize: 23,
                      color: Color(0xFF4c53a5),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              SizedBox(
                width: 25,
              ),
              InkWell(
                onTap: () => {Navigator.pushNamed(context, "/favorite")},
                child: arguments['fav'] == true
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.favorite_outline_outlined,
                        color: Colors.red,
                      ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          child: Image(
            image: NetworkImage("${arguments['thumbnail']}"),
            height: 300,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(children: [
          Container(
            width: 320,
            child: RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                strutStyle: StrutStyle(fontSize: 15.0),
                text: TextSpan(
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4c53a5)),
                    text: "${arguments['name']}")),
          ),
        ]),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          RatingBar.builder(
            initialRating: 4,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 30,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.favorite,
              color: Color(0xFF4c53a5),
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ]),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Text(
          "${arguments['description']}",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 12, color: Color(0xFF4c53a5)),
        ),
      ),
      // Padding(
      //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      //   child: Row(
      //     children: [
      //       Text(
      //         "Size :",
      //         style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             color: Color(0xFF4c53a5),
      //             fontSize: 15),
      //       ),
      //       SizedBox(
      //         width: 20,
      //       ),
      //       Row(
      //         children: [
      //           for (int i = 1; i < 6; i++)
      //             Container(
      //                 padding: EdgeInsets.all(4),
      //                 margin: EdgeInsets.symmetric(horizontal: 10),
      //                 decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.circular(20),
      //                     boxShadow: [
      //                       BoxShadow(
      //                           color: Colors.grey.withOpacity(0.5),
      //                           spreadRadius: 1,
      //                           blurRadius: 10),
      //                     ]),
      //                 child: Text("$i"))
      //         ],
      //       )
      //     ],
      //   ),
      // // ),
      // Padding(
      //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      //   child: Row(
      //     children: [
      //       Text(
      //         "Colors :",
      //         style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             color: Color(0xFF4c53a5),
      //             fontSize: 15),
      //       ),
      //       SizedBox(
      //         width: 20,
      //       ),
      //       Row(
      //         children: [
      //           for (int i = 0; i < 5; i++)
      //             Container(
      //               width: 20,
      //               height: 20,
      //               padding: EdgeInsets.all(4),
      //               margin: EdgeInsets.symmetric(horizontal: 10),
      //               decoration: BoxDecoration(
      //                   color: clrs[i],
      //                   borderRadius: BorderRadius.circular(20),
      //                   boxShadow: [
      //                     BoxShadow(
      //                         color: Colors.grey.withOpacity(0.5),
      //                         spreadRadius: 1,
      //                         blurRadius: 10),
      //                   ]),
      //             )
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      Expanded(child: Container()),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                      color: Color(0xFF4C53A5),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${arguments['price']}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5)),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF4C53A5),
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () => {
                  // Navigator.pushNamed(context, "/payment")
                  isInCart.contains(arguments['id'])
                      ? removeCart(arguments['id'])
                      : sendCart(arguments['id'])
                },
                child: isInCart.contains(arguments['id'])
                    ? Text(
                        "Remove From cart",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    : Text(
                        "Add to cart",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
              ),
            )
          ],
        ),
      ),
    ]));
  }
}
