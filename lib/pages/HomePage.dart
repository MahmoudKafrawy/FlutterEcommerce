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
  final screens = [HomeBody(), Categories(), Me()];
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
    );
  }
}
