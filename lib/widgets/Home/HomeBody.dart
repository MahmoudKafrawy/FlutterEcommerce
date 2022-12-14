import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/widgets/Home/CategoriesWidget.dart';
import 'package:ecommerce/widgets/Home/HomeAppBar.dart';
import 'package:ecommerce/widgets/Home/ItemsWidget.dart';

import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: HomeAppBar(),
      ),
      Flexible(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15),
                decoration: const BoxDecoration(
                  color: Color(0xFFedecf2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () => {Navigator.pushNamed(context, "/search2")},
                        child: Row(
                          children: [
                            //search
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                height: 50,
                                child: TextFormField(
                                  enabled: false,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search..."),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.search,
                              color: Color(0xFF4c53a5),
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(height: 120, autoPlay: true),
                      items: [1, 2, 3, 4, 5, 6, 7].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 2.0),
                                decoration: BoxDecoration(color: Colors.amber),
                                child: Image.asset(
                                  "assets/ads/${i}.gif",
                                  fit: BoxFit.cover,
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: const Text(
                        "Brands ",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF4c53a5),
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    //Categories
                    CategoriesWidget(),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: const Text(
                        "Best Selling",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF4c53a5),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ItemsWidget()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
