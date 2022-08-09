import 'package:badges/badges.dart';
import 'package:ecommerce/pages/Cart.dart';
import 'package:ecommerce/pages/Categories.dart';
import 'package:ecommerce/pages/Me.dart';
import 'package:ecommerce/widgets/Home/CategoriesWidget.dart';
import 'package:ecommerce/widgets/Home/HomeBody.dart';
import 'package:ecommerce/widgets/Home/HomeAppBar.dart';
import 'package:ecommerce/widgets/Home/ItemsWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [HomeBody(), Categories(), Me(), Cart()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (ind) => setState(() => currentIndex = ind),
        selectedItemColor: Color(0xFF4c53a5),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 35,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.apps_outlined,
              size: 35,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 35,
            ),
            label: 'Me',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 35,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 20,
                      minHeight: 15,
                    ),
                    child: Text(
                      "5",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
