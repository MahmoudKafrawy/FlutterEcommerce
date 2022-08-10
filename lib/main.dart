import 'package:ecommerce/pages/Cart.dart';
import 'package:ecommerce/pages/Categories.dart';
import 'package:ecommerce/pages/CheckOut.dart';
import 'package:ecommerce/pages/Favorites.dart';
import 'package:ecommerce/pages/LogIn.dart';
import 'package:ecommerce/pages/LocationPicker.dart';
import 'package:ecommerce/pages/Me.dart';
import 'package:ecommerce/pages/Payment.dart';
import 'package:ecommerce/pages/Product.dart';
import 'package:ecommerce/pages/Search.dart';
import 'package:ecommerce/pages/Settings.dart';
import 'package:ecommerce/providers/favorites_counter.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/pages/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
// For Android (dark icons)
    ),
  );
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Counter())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // appBarTheme: AppBarTheme(
        //   iconTheme: IconThemeData(color: Colors.black),
        //   color: Colors.deepPurpleAccent,
        //   foregroundColor: Colors.black,
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     //<-- SEE HERE
        //     // Status bar color
        //     statusBarColor: Colors.red,
        //     statusBarIconBrightness: Brightness.dark,
        //     statusBarBrightness: Brightness.light,
        //   ),
        // ),
      ),
      routes: {
        "/": (context) => HomePage(),
        "/homepage": (context) => HomePage(),
        "/categories": (context) => Categories(),
        "/me": (context) => Me(),
        "/favorites": (context) => Favorites(),
        "/cart": (context) => Cart(),
        "/product": (context) => Product(),
        "/checkout": (context) => CheckOut(),
        "/payment": (context) => Payment(),
        "/setting": (context) => Settings(),
        "/login": (context) => LogIn(),
        "/location": (context) => LocationPicker(),
        "/search": (context) => Search(),
      },
    );
  }
}
