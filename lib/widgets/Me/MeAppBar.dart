import 'package:badges/badges.dart';
import 'package:ecommerce/pages/Favorites.dart';
import 'package:flutter/material.dart';

class MeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.login,
              size: 30,
              color: Color(0xFF4c53a5),
            ),
          ),
          Padding(
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
          Badge(
            toAnimate: false,
            badgeColor: Colors.red,
            padding: EdgeInsets.all(7),
            badgeContent: Text(
              "1",
              style: TextStyle(color: Colors.white),
            ),
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/setting");
                },
                child: Icon(
                  Icons.settings,
                  color: Color(0xFF4c53a5),
                  size: 35,
                )),
          ),
        ],
      ),
    );
  }
}
