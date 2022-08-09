import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/Product.dart';

class FavtItemSample extends StatefulWidget {
  const FavtItemSample({Key? key}) : super(key: key);

  @override
  State<FavtItemSample> createState() => _FavtItemSampleState();
}

class _FavtItemSampleState extends State<FavtItemSample> {
  List<Product> productList = [];
  List<Product> favList = [];
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

          if (productList[i].isFavorite! == true) {
            favList.add(productList[i]);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return favList.length == 0
        ? CircularProgressIndicator()
        : Column(
            children: [
              for (int i = 0; i < favList.length; i++)
                Container(
                  height: 110,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                        child: Image.asset("assets/2.png"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Product title",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4C53A5)),
                            ),
                            Text(
                              "\$55",
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
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite_border_outlined,
                                size: 35,
                                color: Color(0xFF4C53A5),
                              )
                            ]),
                      )
                    ],
                  ),
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
