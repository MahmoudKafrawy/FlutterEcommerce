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
              Container(
                height: 700,
                padding: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    color: Color(0xFFEDECF2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(
                  children: [
                    CartItemSample(),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF4C53A5),
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Add Coupon Code",
                                style: TextStyle(
                                    color: Color(0xFF4C53A5),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ))
                        ],
                      ),
                    )
                  ],
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
