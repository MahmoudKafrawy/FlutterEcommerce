import 'package:flutter/material.dart';
import 'package:ecommerce/model/Brands.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesWidget extends StatefulWidget {
  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<Brands> brandsList = [];
  late Brands brandsItem;
  Uri url =
      Uri.parse("https://flutter-api-three.vercel.app/api/products/brands");

  fetchData() async {
    //Response   X= Future<Response>
    http.Response response = await http.get(url);
    List result = [];
    if (response.statusCode == 200) {
      result = jsonDecode(response.body);

      setState(() {
        for (int i = 0; i < result.length; i++) {
          brandsItem = Brands.fromJsonData(result[i]);
          brandsList.add(brandsItem);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: brandsList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Row(
              children: [
                for (int i = 0; i < brandsList.length; i++)
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: NetworkImage(
                              brandsList[i].thumbnail!,
                            ),
                            height: 100,
                            width: 100,
                          ),
                          Text(brandsList[i].brand!)
                        ],
                      )),
              ],
            ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
}
