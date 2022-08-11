import 'package:ecommerce/providers/favorites_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:ecommerce/providers/favorites_counter.dart';
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

  sendFav(id) async {
    try {
      var response = await http.post(
          Uri.parse("https://flutter-api-three.vercel.app/api/products/${id}"),
          headers: {
            'Content-Type': "application/x-www-form-urlencoded",
          },
          body: {}).then((value) {
        print("${jsonDecode(value.body)['updatedProduct']['isFavorite']}");

        if (jsonDecode(value.body)['updatedProduct']['isFavorite'] == true) {
          context.read<Counter>().increment();
        } else {
          context.read<Counter>().decrement();
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<Counter>().count == 0
        ? Center(child: Text("Please Add Items"))
        : Column(
            children: [
              for (int i = 0; i < context.watch<Counter>().count; i++)
                Container(
                  height: 110,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.only(right: 10, left: 20),
                        child:
                            Image(image: NetworkImage(favList[i].thumbnail!)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 180,
                              child: RichText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  strutStyle: StrutStyle(fontSize: 14.0),
                                  text: TextSpan(
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(0xFF4C53A5)),
                                      text: favList[i].name!)),
                            ),
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
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  sendFav(favList[i].id);
                                },
                                child: Icon(
                                  Icons.delete_outline_outlined,
                                  size: 35,
                                  color: Color(0xFF4C53A5),
                                ),
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
