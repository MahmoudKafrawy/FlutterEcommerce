import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../model/Product.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/providers/Cart_counter.dart';

class CartItemSample extends StatefulWidget {
  const CartItemSample({Key? key}) : super(key: key);

  @override
  State<CartItemSample> createState() => _CartItemSampleState();
}

class _CartItemSampleState extends State<CartItemSample> {
  List<Product> productList = [];
  List<Product> favList = [];
  List isInCart = [];
  int totalprice = 0;
  late Product productItem;
  Uri url = Uri.parse("https://flutter-api-three.vercel.app/api/products");

  fetchData() async {
    totalprice = 0;
    //Response   X= Future<Response>
    http.Response response = await http.get(url);
    List result = [];
    if (response.statusCode == 200) {
      result = jsonDecode(response.body);

      setState(() {
        for (int i = 0; i < result.length; i++) {
          productItem = Product.fromJsonData(result[i]);
          productList.add(productItem);

          if (isInCart.contains(productList[i].id) == true) {
            favList.add(productList[i]);
          }
          for (int i = 0; i < favList.length; i++) {
            totalprice = favList[i].price!;
          }
        }
        context.read<CartCounter>().setValue(totalprice);
      });

      print("hello");
    }
  }

  @override
  Widget build(BuildContext context) {
    isInCart = [...context.watch<CartCounter>().isinCart];

    return favList.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Column(
                children: [
                  for (int i = 0; i < isInCart.length; i++)
                    Container(
                      height: 110,
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            margin: EdgeInsets.only(right: 15, left: 20),
                            child: Image(
                                image: NetworkImage(favList[i].thumbnail!)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    strutStyle: StrutStyle(fontSize: 14.0),
                                    text: TextSpan(
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Color(0xFF4C53A5)),
                                        text: favList[i].name!)),
                                Text(
                                  "\$${favList[i].price!}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4C53A5)),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 10),
                                            ]),
                                        child: Icon(
                                          CupertinoIcons.plus,
                                          size: 18,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF4C53A5)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 10),
                                            ]),
                                        child: Icon(
                                          CupertinoIcons.minus,
                                          size: 18,
                                        ),
                                      )
                                    ],
                                  )
                                ]),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ],
          );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }
}
