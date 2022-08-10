import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ecommerce/model/Product.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:ecommerce/providers/favorites_counter.dart';

class ItemsWidget extends StatefulWidget {
  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  bool _favFlag = false;
  List<Product> productList = [];
  late Product productItem;
  Uri url = Uri.parse("https://flutter-api-three.vercel.app/api/products");

  fetchData() async {
    //Response   X= Future<Response>
    http.Response response = await http.get(url);
    List result = [];
    if (response.statusCode == 200) {
      result = jsonDecode(response.body);

      setState(() {
        for (int i = 0; i < result.length; i++) {
          productItem = Product.fromJsonData(result[i]);
          productList.add(productItem);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return productList.isEmpty
        ? Center(child: CircularProgressIndicator())
        : GridView.count(
            childAspectRatio: 0.67,
            physics: NeverScrollableScrollPhysics(),
            // crossAxisSpacing: 2,
            // mainAxisSpacing: 2,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              for (int i = 0; i < productList.length; i++)
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color(0xFF4c53A5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "-50%",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (() {
                            if (_favFlag == false) {
                              context.read<Counter>().increment();
                              setState(() {
                                _favFlag = true;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('This Item was added to Favorites'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              context.read<Counter>().decrement();
                              setState(() {
                                _favFlag = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'This Item was removed to Favorites'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          }),
                          child: Icon(
                            productList[i].isFavorite!
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            size: 25,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: CircleBorder(),
                        splashColor: Color(0xFF4c53a5),
                        onTap: () => {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            Navigator.pushNamed(context, "/product",
                                arguments: {
                                  "name": productList[i].name,
                                  "thumbnail": productList[i].thumbnail,
                                  "description": productList[i].description
                                });
                          })
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Image(
                            image: NetworkImage(productList[i].thumbnail!),
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            strutStyle: StrutStyle(fontSize: 15.0),
                            text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4c53a5)),
                                text: productList[i].name!))),
                    Container(
                        padding: EdgeInsets.only(top: 5),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            strutStyle: StrutStyle(fontSize: 12.0),
                            text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 119, 119, 119)),
                                text: productList[i].description!))),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${productList[i].price!}",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4c53A5),
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.add_shopping_cart_sharp,
                            size: 25,
                            color: Color(0xFF4c53A5),
                          )
                        ],
                      ),
                    )
                  ]),
                )
            ],
          );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }
}
