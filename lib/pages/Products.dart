import 'dart:convert';

import 'package:ecommerce/model/Product.dart';
import 'package:ecommerce/widgets/Home/ItemsWidget.dart';
import 'package:ecommerce/widgets/Products/ItemsFromCategory.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Productss extends StatefulWidget {
  Productss({
    required this.brandName,
  });
  String brandName;

  @override
  State<Productss> createState() => _ProductssState();
}

class _ProductssState extends State<Productss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.brandName),
        backgroundColor: Color(0xFF4C53A5),
      ),
      body: ListView(children: [ItemsWidget()]),
    );
  }
}
