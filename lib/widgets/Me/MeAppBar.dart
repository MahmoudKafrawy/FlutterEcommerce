import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class MeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 45, right: 25, left: 25, bottom: 15),
      child: Row(
        children: [
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.35),
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Me",
              style: TextStyle(
                  fontSize: 23,
                  color: Color(0xFF4c53a5),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          GestureDetector(
              onTap: () => {Navigator.pushNamed(context, "/setting")},
              child: Icon(
                Icons.settings,
                color: Color(0xFF4c53a5),
                size: 30,
              )),
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
