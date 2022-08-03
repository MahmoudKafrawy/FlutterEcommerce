import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widgets/ProductAppBar.dart';

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        padding: EdgeInsets.only(top: 15),
        child: productAppBar(),
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          child: Image.asset(
            "images/1.png",
            height: 300,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(children: [
          Text(
            "Product name",
            style: TextStyle(
                fontSize: 25,
                color: Color(0xFF4c53a5),
                fontWeight: FontWeight.bold),
          ),
        ]),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          RatingBar.builder(
            initialRating: 4,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 30,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.favorite,
              color: Color(0xFF4c53a5),
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10),
                ]),
            child: Icon(
              CupertinoIcons.plus,
              size: 18,
            ),
          ),
        ]),
      )
    ]));
  }
}
