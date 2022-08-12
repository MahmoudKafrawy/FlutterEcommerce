import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/providers/Cart_counter.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      color: Color(0xFF4C53A5),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${context.watch<CartCounter>().count}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5)),
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF4C53A5),
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () => {Navigator.pushNamed(context, "/payment")},
                child: Text(
                  "Check out",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
