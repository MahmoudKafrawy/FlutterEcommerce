import 'package:ecommerce/widgets/Payment/PaymentAppBar.dart';
import 'package:flutter/material.dart';
import '../widgets/Cart/CartItemSample.dart';
import '../widgets/Payment/PaymentBottomNavBar.dart';

import 'package:provider/provider.dart';
import 'package:ecommerce/providers/Cart_counter.dart';

class _TextStyle {
  static final style1 = TextStyle(
      fontSize: 20, color: Color(0xFF4c53a5), fontWeight: FontWeight.bold);
}

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: PaymentAppBar(),
          ),
          Flexible(
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ListView(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: _TextStyle.style1,
                          ),
                          Text(
                            "\$${context.watch<CartCounter>().count}",
                            style: _TextStyle.style1,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shoping Fees",
                            style: _TextStyle.style1,
                          ),
                          Text(
                            "\$20",
                            style: _TextStyle.style1,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 175,
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  hintText: "Coupon..",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      width: 2.0,
                                    ),
                                  )),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Color(0xFF4C53A5),
                                borderRadius: BorderRadius.circular(15)),
                            child: InkWell(
                              onTap: () =>
                                  {Navigator.pushNamed(context, "/payment")},
                              child: Text(
                                "Validate",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discount",
                            style: _TextStyle.style1,
                          ),
                          Text(
                            "\$0.0",
                            style: _TextStyle.style1,
                          )
                        ],
                      )
                    ]),
                  )))
        ],
      ),
      bottomNavigationBar: PaymentBottomNavBar(),
    );
  }
}
