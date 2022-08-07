import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemSample extends StatelessWidget {
  const CartItemSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i < 4; i++)
          Container(
            height: 110,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(right: 15, left: 20),
                  child: Image.asset("assets/2.png"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Product title",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5)),
                      ),
                      Text(
                        "\$55",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5)),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border_outlined,
                          size: 35,
                          color: Color(0xFF4C53A5),
                        )
                      ]),
                )
              ],
            ),
          )
      ],
    );
  }
}
