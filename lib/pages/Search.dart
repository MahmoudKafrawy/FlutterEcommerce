import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ecommerce/model/Product.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:ecommerce/providers/favorites_counter.dart';
import 'package:ecommerce/providers/Items_fetch.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchBarController = TextEditingController();
  List<Product> productList = [];
  List<Product> searchList = [];
  List<Product> searchListFinal = [];

  late Product productItem;
  Uri url = Uri.parse("https://flutter-api-three.vercel.app/api/products");

  fetchData() async {
    productList = [];
    searchList = [];
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

  searchInData(string) {
    for (var i = 0; i < productList.length; i++) {
      if (productList[i].name!.contains(string) == true) {
        searchList.add(productList[i]);
      }
    }
    searchListFinal = searchList;

    setState(() {});
  }

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
                      child: TextFormField(
                        controller: searchBarController,
                        autofocus: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Search..."),
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
          Column(
            children: [
              for (int i = 0; i < searchListFinal.length; i++)
                Container(
                  child: Text("${searchList[i].name}"),
                ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();

    searchBarController.addListener(() {
      searchInData(searchBarController.text);
    });
  }

  // @override
  // void dispose() {
  //   // Clean up the controller when the Widget is disposed
  //   searchBarController.dispose();
  //   super.dispose();
  // }
}
