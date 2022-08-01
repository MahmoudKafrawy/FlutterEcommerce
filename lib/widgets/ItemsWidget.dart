import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      // crossAxisSpacing: 2,
      // mainAxisSpacing: 2,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color(0xFF4c53A5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "-50%",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.favorite_border_outlined,
                  size: 25,
                  color: Colors.red,
                )
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: Image.asset("images/1.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Title",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4c53A5)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Description",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4c53A5)),
              ),
            )
          ]),
        )
      ],
    );
  }
}
