import 'package:flutter/material.dart';
import 'package:ecommerce/model/Categories.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  List<CategoriesList> categoryList = [];
  List<CategoriesList> fetchedList = [];

  late CategoriesList categoryItem;
  Uri url =
      Uri.parse("https://flutter-api-three.vercel.app/api/products/categories");

  fetchData() async {
    //Response   X= Future<Response>
    http.Response response = await http.get(url);
    List result = [];
    if (response.statusCode == 200) {
      result = jsonDecode(response.body);

      setState(() {
        for (int i = 0; i < result.length; i++) {
          categoryItem = CategoriesList.fromJsonData(result[i]);
          categoryList.add(categoryItem);
        }
      });
    }
  }

  @override
  build(BuildContext context) {
    return GridView.count(
      // childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      // crossAxisSpacing: 2,
      // mainAxisSpacing: 2,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < 8; i++)
          Container(
              // height: 100,
              margin: EdgeInsets.only(top: 0),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child:
                          Image.asset("images/1.png", width: 50, height: 50)),
                  SizedBox(
                    height: 0,
                  ),
                  Text("Shoes"),
                ],
              )),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
}
