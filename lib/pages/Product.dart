import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widgets/ProductAppBar.dart';

class Product extends StatelessWidget {
  List<Color> clrs = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.orange
  ];

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
        body: Column(children: [
      Container(
        padding: EdgeInsets.only(top: 15),
        child: productAppBar(),
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          child: Image(
            image: NetworkImage("${arguments['thumbnail']}"),
            height: 300,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(children: [
          Text(
            "${arguments['name']}",
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
              child: Row(
            children: [
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text("1"),
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
                  CupertinoIcons.minus,
                  size: 18,
                ),
              )
            ],
          ))
        ]),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Text(
          "${arguments['description']}",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 12, color: Color(0xFF4c53a5)),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Row(
          children: [
            Text(
              "Size :",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4c53a5),
                  fontSize: 15),
            ),
            SizedBox(
              width: 20,
            ),
            Row(
              children: [
                for (int i = 1; i < 6; i++)
                  Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10),
                          ]),
                      child: Text("$i"))
              ],
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Row(
          children: [
            Text(
              "Colors :",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4c53a5),
                  fontSize: 15),
            ),
            SizedBox(
              width: 20,
            ),
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 20,
                    height: 20,
                    padding: EdgeInsets.all(4),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: clrs[i],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10),
                        ]),
                  )
              ],
            ),
          ],
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price",
                style: TextStyle(
                    color: Color(0xFF4C53A5),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${arguments['price']}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5)),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF4C53A5),
                borderRadius: BorderRadius.circular(20)),
            child: InkWell(
              onTap: () => {Navigator.pushNamed(context, "/payment")},
              child: Text(
                "Check out",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ]));
  }
}
