import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 45, right: 25, left: 25, bottom: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () => {Navigator.pushNamed(context, "/login")},
            child: const Icon(
              Icons.sort,
              size: 30,
              color: Color(0xFF4c53a5),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Shop",
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
              "1",
              style: TextStyle(color: Colors.white),
            ),
            child: GestureDetector(
                onTap: () => {Navigator.pushNamed(context, "/cart")},
                child: Icon(
                  Icons.favorite,
                  color: Color(0xFF4c53a5),
                  size: 30,
                )),
          ),
          SizedBox(
            width: 25,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: CircleBorder(),
              splashColor: Color(0xFF4c53a5),
              onTap: () => {
                Future.delayed(const Duration(milliseconds: 200), () {
                  Navigator.pushNamed(context, "/cart");
                })
                // Navigator.pushNamed(context, "/cart")
              },
              child: Badge(
                toAnimate: false,
                badgeColor: Colors.red,
                padding: EdgeInsets.all(7),
                badgeContent: Text(
                  "5",
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Color(0xFF4c53a5),
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
