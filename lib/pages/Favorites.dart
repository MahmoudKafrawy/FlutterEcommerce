import 'package:ecommerce/widgets/Favorites/FavoritesAppBar.dart';
import 'package:flutter/material.dart';
import '../widgets/Favorites/FavtItemSample.dart';
import '../widgets/Favorites/FavortiesBottomNavBar.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        CartAppBar(),
        Container(
          height: 700,
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          child: Column(
            children: [
              FavtItemSample(),
            ],
          ),
        )
      ]),
      bottomNavigationBar: InkWell(
        child: FavoritesBottomNavBar(),
        onTap: () {
          Navigator.pushNamed(context, "/cart");
        },
      ),
    );
  }
}
