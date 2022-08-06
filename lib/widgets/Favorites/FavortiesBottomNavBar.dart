import 'package:flutter/material.dart';

class FavoritesBottomNavBar extends StatelessWidget {
  const FavoritesBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF4C53A5),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Go to shopping Cart",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
