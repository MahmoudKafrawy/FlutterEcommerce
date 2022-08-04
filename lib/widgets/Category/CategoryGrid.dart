import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return GridView.count(
      // childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      // crossAxisSpacing: 2,
      // mainAxisSpacing: 2,
      crossAxisCount: 3,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < 8; i++)
          Container(
              // height: 100,
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child:
                          Image.asset("images/1.png", width: 50, height: 50)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Shoes"),
                ],
              )),
      ],
    );
  }
}
