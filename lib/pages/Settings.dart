import 'package:ecommerce/widgets/Category/CategoryGrid.dart';
import 'package:ecommerce/widgets/Category/CategoryNavBar.dart';
import 'package:ecommerce/widgets/SearchWidget.dart';
import 'package:ecommerce/widgets/Settings/SettingAppBar.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(top: 40),
          child: SettingAppBar(),
        ),
        Flexible(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Color(0xFFedecf2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,

                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Address",
                                  style: TextStyle(
                                      color: Color(0xFF4C53A5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                            Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Text(
                                  "Ismalia >",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                        color: Color(0xFF4C53A5),
                        borderRadius: BorderRadius.circular(30)),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.05),
                    child: Center(
                      child: Text(
                        "Log out",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.045),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
    ;
  }
}
