import 'package:ecommerce/pages/Cart.dart';
import 'package:ecommerce/pages/Categories.dart';
import 'package:ecommerce/pages/CheckOut.dart';
import 'package:ecommerce/pages/Favorites.dart';
import 'package:ecommerce/pages/IntroScreens.dart';
import 'package:ecommerce/pages/LogIn.dart';
import 'package:ecommerce/pages/LocationPicker.dart';
import 'package:ecommerce/pages/Me.dart';
import 'package:ecommerce/pages/Payment.dart';
import 'package:ecommerce/pages/Product.dart';
import 'package:ecommerce/pages/Registration.dart';
import 'package:ecommerce/pages/Search.dart';
import 'package:ecommerce/pages/Settings.dart';
import 'package:ecommerce/providers/Brands_fetch.dart';
import 'package:ecommerce/providers/Items_fetch.dart';
import 'package:ecommerce/providers/favorites_counter.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/pages/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/providers/Cart_counter.dart';
import 'package:ecommerce/providers/Items_fetch.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
// For Android (dark icons)
    ),
  );
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Counter(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartCounter(),
          ),
          ChangeNotifierProvider(
            create: (context) => ItemsFecth(),
          ),
          ChangeNotifierProvider(
            create: (context) => BrandsFetch(),
          )
        ],
        child: MyApp(
          showHome: showHome,
        )),
  );
}

class MyApp extends StatelessWidget {
  final bool showHome;
  MyApp({required this.showHome});
  //

  //
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
        "/": (context) => showHome ? HomePage() : OnBoardingPage(),
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
        "/registration": (context) => Registration(),
        "/location": (context) => LocationPicker(),
        "/search": (context) => Search(),
      },
    );
  }
}
