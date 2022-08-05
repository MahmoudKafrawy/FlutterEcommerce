import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CategoryNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 30, right: 25, left: 25, bottom: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.sort,
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
            badgeColor: Colors.red,
            padding: EdgeInsets.all(7),
            badgeContent: Text(
              "1",
              style: TextStyle(color: Colors.white),
            ),
            child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.favorite,
                  color: Color(0xFF4c53a5),
                  size: 30,
                )),
          ),
          SizedBox(
            width: 25,
          ),
          Badge(
            badgeColor: Colors.red,
            padding: EdgeInsets.all(7),
            badgeContent: Text(
              "5",
              style: TextStyle(color: Colors.white),
            ),
            child: InkWell(
                onTap: () => {Navigator.pushNamed(context, "/cart")},
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Color(0xFF4c53a5),
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }
}
