import 'package:ecommerce/pages/Cart.dart';
import 'package:ecommerce/pages/Categories.dart';
import 'package:ecommerce/pages/CheckOut.dart';
import 'package:ecommerce/pages/Favorites.dart';
import 'package:ecommerce/pages/Me.dart';
import 'package:ecommerce/pages/NotSignedIn.dart';
import 'package:ecommerce/pages/Payment.dart';
import 'package:ecommerce/pages/Product.dart';
import 'package:ecommerce/pages/SignedIn.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routes: {
        "/": (context) => HomePage(),
        "/categories": (context) => Categories(),
        "/me": (context) => Me(),
        "/favorites": (context) => Favorites(),
        "/cart": (context) => Cart(),
        "/product": (context) => Product(),
        "/checkout": (context) => CheckOut(),
        "/payment": (context) => Payment(),
        "/signedin": (context) => SignedIn(),
        "/notsignin": (context) => NotSignedIn(),
      },
    );
  }
}
