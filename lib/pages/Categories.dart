import 'package:ecommerce/widgets/Category/CategoryNavBar.dart';
import 'package:ecommerce/widgets/Category/CategoryGrid.dart';
import 'package:ecommerce/widgets/SearchWidget.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(top: 15),
          child: CategoryNavBar(),
        ),
        Flexible(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(
              padding: EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Color(0xFFedecf2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SearchWidget(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 80,
                        height: 700,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20))),
                        child: SingleChildScrollView(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for (int i = 1; i < 100; i++) Text("hello"),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 700,
                            child:
                                SingleChildScrollView(child: CategoryGrid())),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
