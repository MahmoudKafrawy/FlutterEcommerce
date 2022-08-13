import 'package:ecommerce/pages/Favorites.dart';
import 'package:ecommerce/widgets/Favorites/FavtItemSample.dart';
import 'package:ecommerce/widgets/Me/MeAppBar.dart';
import 'package:ecommerce/widgets/Settings/SettingAppBar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/Favorites/FavtItemSample.dart';

import 'package:provider/provider.dart';
import 'package:ecommerce/providers/Cart_counter.dart';

class Me extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(70), child: MeAppBar()),
      body: Column(children: [
        Flexible(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              decoration: const BoxDecoration(
                color: Color(0xFFedecf2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Center(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 180, bottom: 40, top: 15),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Orders',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/cart");
                            },
                            child: Text(
                              'More',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        // height: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: 20, top: 10, bottom: 10),
                                child: Text(
                                  "Total Price : " +
                                      "\$${context.watch<CartCounter>().count}",
                                  style: TextStyle(
                                      color: Color(0xFF4C53A5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                            // Container(
                            //     margin: EdgeInsets.only(
                            //         left: 20, top: 10, bottom: 10),
                            //     child: Text(
                            //       "Created at:",
                            //       style: TextStyle(
                            //           color: Color(0xFF4C53A5),
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 18),
                            //     )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'WishList',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, "/favorites"),
                            child: Text(
                              'More',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: FavtItemSample(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
