import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class productAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 30, right: 25, left: 25, bottom: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () => {Navigator.pop(context)},
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Color(0xFF4c53a5),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Prdouct",
              style: TextStyle(
                  fontSize: 23,
                  color: Color(0xFF4c53a5),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 25,
          ),
          InkWell(
            onTap: () => {Navigator.pushNamed(context, "/favorite")},
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.red,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
