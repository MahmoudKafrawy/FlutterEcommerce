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
import 'package:provider/provider.dart';
import 'package:ecommerce/providers/Cart_counter.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List isinCart = [];
  int currentIndex = 0;
  final screens = [HomeBody(), Categories(), Me(), Cart()];
  @override
  Widget build(BuildContext context) {
    List isinCart = [...context.watch<CartCounter>().isinCart];

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
              children: [
                Badge(
                  animationType: BadgeAnimationType.scale,
                  animationDuration: Duration(milliseconds: 150),
                  badgeColor: Colors.red,
                  padding: EdgeInsets.all(7),
                  badgeContent: Text(
                    "${isinCart.length}",
                    style: TextStyle(color: Colors.white),
                  ),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Color(0xFF4c53a5),
                    size: 30,
                  ),
                ),
              ],
            ),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
