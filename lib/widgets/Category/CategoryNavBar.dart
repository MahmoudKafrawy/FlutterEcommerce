import 'package:badges/badges.dart';
import 'package:ecommerce/pages/Favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/providers/favorites_counter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ecommerce/pages/LogIn.dart';

class CategoryNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () => {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRight,
                  duration: Duration(milliseconds: 300),
                  child: const LogIn(),
                ),
              ),
            },
            child: const Icon(
              Icons.login_outlined,
              size: 30,
              color: Color(0xFF4c53a5),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Category",
              style: TextStyle(
                  fontSize: 23,
                  color: Color(0xFF4c53a5),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          Badge(
            toAnimate: false,
            badgeColor: Colors.red,
            padding: EdgeInsets.all(7),
            badgeContent: Text(
              "${context.watch<Counter>().list.length}",
              style: TextStyle(color: Colors.white),
            ),
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/favorites");
                },
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Color(0xFF4c53a5),
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }
}
