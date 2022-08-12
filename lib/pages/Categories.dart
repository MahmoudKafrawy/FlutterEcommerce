import 'package:ecommerce/widgets/Category/CategoryNavBar.dart';
import 'package:ecommerce/widgets/Category/CategoryGrid.dart';
import 'package:ecommerce/widgets/SearchWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ecommerce/model/Categories.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          child: CategoryNavBar(),
        ),
        Flexible(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(
              padding: EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Color(0xFFedecf2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SearchWidget(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            for (int i = 1; i < categoryList.length; i++)
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                onPressed: () {},
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    categoryList[i].name!,
                                    style: TextStyle(
                                        color: Color(0xFF4c53a5),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: MediaQuery.of(context).size.height * 0.7,
                            child:
                                SingleChildScrollView(child: CategoryGrid())),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
}
