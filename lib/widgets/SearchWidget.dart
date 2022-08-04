import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        children: [
          //search
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              height: 50,
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Search..."),
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
    );
  }
}
