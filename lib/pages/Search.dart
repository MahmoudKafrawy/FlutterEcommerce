import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () => {Navigator.pushNamed(context, "/search")},
              child: Row(
                children: [
                  //search
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 50,
                      child: TextFormField(
                        autofocus: true,
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
            ),
          ),
        ],
      ),
    );
  }
}
