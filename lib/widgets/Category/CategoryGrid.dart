import 'package:flutter/material.dart';
import 'package:ecommerce/model/Categories.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ecommerce/model/Product.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/providers/Categories_provider.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  List categoryList = [];
  List<CategoriesList> fetchedList = [];
  List<Product> productList = [];
  late Product productItem;
  late String selectedCat;

  late CategoriesList categoryItem;
  Uri url =
      Uri.parse("https://flutter-api-three.vercel.app/api/products/categories");
  Uri urlAll = Uri.parse("https://flutter-api-three.vercel.app/api/products");

  fetchDataAll() async {
    //Response   X= Future<Response>
    http.Response response = await http.get(urlAll);
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

  // fetchData() async {
  //   //Response   X= Future<Response>
  //   http.Response response = await http.get(url);
  //   List result = [];
  //   if (response.statusCode == 200) {
  //     result = jsonDecode(response.body);

  //     setState(() {
  //       for (int i = 0; i < result.length; i++) {
  //         categoryItem = CategoriesList.fromJsonData(result[i]);
  //         categoryList.add(categoryItem);
  //       }
  //     });
  //   }
  // }

  @override
  build(BuildContext context) {
    selectedCat = context.watch<CategoriesProvider>().catName;
    categoryList = [];
    for (var i = 0; i < productList.length; i++) {
      if (productList[i].category == selectedCat) {
        categoryList.add(productList[i]);
      }
    }

    return GridView.count(
      // childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      // crossAxisSpacing: 2,
      // mainAxisSpacing: 2,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < categoryList.length; i++)
          InkWell(
            onTap: () => {
              Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.pushNamed(context, "/product", arguments: {
                  "name": categoryList[i].name,
                  "thumbnail": categoryList[i].thumbnail,
                  "description": categoryList[i].description,
                  "price": categoryList[i].price,
                });
              })
            },
            child: Container(
                // height: 100,
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(children: [
                        Image(
                          height: 50,
                          image: NetworkImage(categoryList[i].thumbnail!),
                        ),
                        Spacer(),
                        RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            strutStyle: StrutStyle(fontSize: 15.0),
                            text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4c53a5)),
                                text: categoryList[i].name!)),
                      ]),
                    ),
                  ],
                )),
          ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchData();
    fetchDataAll();
  }
}
