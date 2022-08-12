import 'package:ecommerce/widgets/Cart/CartAppBar.dart';
import 'package:flutter/material.dart';
import '../widgets/Cart/CartItemSample.dart';
import '../widgets/Cart/CartBottomNavBar.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CartAppBar(),
          Flexible(
              child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView(children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 650,
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Color(0xFFEDECF2),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Column(
                    children: [
                      CartItemSample(),
                    ],
                  ),
                ),
              )
            ]),
          )),
        ],
      ),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}
