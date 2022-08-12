import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Favorties",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5)),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
