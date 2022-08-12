import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ecommerce/model/Product.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:ecommerce/providers/favorites_counter.dart';
import 'package:ecommerce/providers/Items_fetch.dart';

class Search2 extends StatefulWidget {
  Search2({Key? key}) : super(key: key);

  @override
  State<Search2> createState() => _Search2State();
}

class _Search2State extends State<Search2> {
  TextEditingController searchBarController = TextEditingController();
  List<Product> productList = [];
  List<Product> searchList = [];

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
        searchList = productList;
      });
    }
  }

  // searchInData(string) {
  //   for (var i = 0; i < productList.length; i++) {
  //     if (productList[i].name!.contains(string) == true) {
  //       searchList.add(productList[i]);
  //     }
  //   }
  //   searchListFinal = searchList;

  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () => {},
              child: Row(
                children: [
                  //search
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 50,
                      child: TextField(
                        onChanged: searchItem,
                        controller: searchBarController,
                        autofocus: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "search..."),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search,
                    color: Color(0xFF4c53a5),
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                final pro = searchList[index];
                return Padding(
                  padding: EdgeInsets.only(left: 25, right: 20),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      onTap: () => {
                        Future.delayed(const Duration(milliseconds: 200), () {
                          Navigator.pushNamed(context, "/product", arguments: {
                            "name": productList[index].name,
                            "thumbnail": productList[index].thumbnail,
                            "description": productList[index].description,
                            "price": productList[index].price,
                            "fav": productList[index].isFavorite
                          });
                        })
                      },
                      child: Text("${productList[index].name!}" +
                          " in " +
                          "${productList[index].category}"),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void searchItem(String query) {
    final sugget = searchList.where((pro) {
      final protitle = pro.name!.toLowerCase();
      final input = query.toLowerCase();
      return protitle.contains(input);
    }).toList();
    setState(() {
      productList = sugget;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();

    // searchBarController.addListener(() {
    //   searchInData(searchBarController.text);
    // });
  }

  // @override
  // void dispose() {
  //   // Clean up the controller when the Widget is disposed
  //   searchBarController.dispose();
  //   super.dispose();
  // }
}
