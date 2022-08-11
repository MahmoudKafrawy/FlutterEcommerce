import 'dart:math';

import 'package:ecommerce/widgets/Favorites/FavoritesAppBar.dart';
import 'package:flutter/material.dart';
import '../widgets/Favorites/FavtItemSample.dart';
import '../widgets/Favorites/FavortiesBottomNavBar.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CartAppBar(),
          Flexible(
              child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView(children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 650,
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFEDECF2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FavtItemSample(),
                    ],
                  ),
                ),
              ),
            ]),
          ))
        ],
      ),
      bottomNavigationBar: InkWell(
        child: FavoritesBottomNavBar(),
        onTap: () {
          Navigator.pushNamed(context, "/cart");
        },
      ),
    );
  }
}
