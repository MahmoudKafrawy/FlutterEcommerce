import 'package:badges/badges.dart';
import 'package:ecommerce/pages/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/providers/favorites_counter.dart';

class HomeAppBar extends StatefulWidget {
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
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
              Icons.sort,
              size: 30,
              color: Color(0xFF4c53a5),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Mega Shop",
              style: TextStyle(
                  fontSize: 23,
                  color: Color(0xFF4c53a5),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: CircleBorder(),
              splashColor: Color(0xFF4c53a5),
              onTap: () => {
                Future.delayed(const Duration(milliseconds: 200), () {
                  Navigator.pushNamed(context, "/favorites");
                })
                // Navigator.pushNamed(context, "/cart")
              },
              child: Badge(
                animationType: BadgeAnimationType.scale,
                animationDuration: Duration(milliseconds: 150),
                badgeColor: Colors.red,
                padding: EdgeInsets.all(7),
                badgeContent: Text(
                  "${context.watch<Counter>().count}",
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Color(0xFF4c53a5),
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
              onTap: () => {Navigator.pushNamed(context, "/location")},
              child: Icon(
                Icons.gps_fixed,
                color: Color(0xFF4c53a5),
                size: 30,
              )),
        ],
      ),
    );
  }
}
