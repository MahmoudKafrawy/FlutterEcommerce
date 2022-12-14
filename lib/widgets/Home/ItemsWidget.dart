import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ecommerce/model/Product.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:ecommerce/providers/favorites_counter.dart';
import 'package:ecommerce/providers/Items_fetch.dart';
import 'package:ecommerce/model/Favorite.dart';
import 'package:ecommerce/providers/Cart_counter.dart';

class ItemsWidget extends StatefulWidget {
  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  bool fetchFlag = false;
  bool _favFlag = false;

  List<Product> productList = [];
  List<Product> favList = [];
  List isInFavPage = [];
  List isInCart = [];

  late Product productItem;
  Uri url = Uri.parse("https://flutter-api-three.vercel.app/api/products");

  fetchData() async {
    productList = [];
    favList = [];
    //Response   X= Future<Response>
    http.Response response = await http.get(url);
    List result = [];
    if (response.statusCode == 200) {
      result = jsonDecode(response.body);

      setState(() {
        for (int i = 0; i < result.length; i++) {
          productItem = Product.fromJsonData(result[i]);
          productList.add(productItem);
          if (productList[i].isFavorite! == true) {
            favList.add(productList[i]);
            context.read<Counter>().addItem(productList[i].id);
            context.read<Counter>().addToFavPage(productList[i].id);
          }
        }
        print(context.read<ItemsFecth>().fetchFlag);
        if (context.read<ItemsFecth>().fetchFlag == false) {
          context.read<ItemsFecth>().setValue(productList);
          context.read<ItemsFecth>().setFetchFlag();
          context.read<Counter>().setValue(favList.length);
        }
      });
    }
  }

  sendFav(id, i) async {
    try {
      var response = await http.post(
          Uri.parse("https://flutter-api-three.vercel.app/api/products/${id}"),
          headers: {
            'Content-Type': "application/x-www-form-urlencoded",
          },
          body: {}).then((value) {
        print("${jsonDecode(value.body)['updatedProduct']['isFavorite']}");

        if (jsonDecode(value.body)['updatedProduct']['isFavorite'] == true) {
          context.read<Counter>().increment();
          context.read<Counter>().addItem(id);
          context.read<Counter>().addToFavPage(id);
        } else {
          context.read<Counter>().decrement();
          context.read<Counter>().removeItem(id);
          context.read<Counter>().removeFromFavPage(id);
        }
        print(context.watch<Counter>().count);
      });
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  sendCart(id) {
    context.read<CartCounter>().addToCartPage(id);
    print(id);
    setState(() {});
  }

  removeCart(id) {
    context.read<CartCounter>().removeFromCartPage(id);
    print(id);
    setState(() {});
  }

  // renderFav() {
  //   for (int i = 0; i < productList.length; i++) {
  //     if (productList[i].isFavorite! == true) {
  //       //
  //       // setState(() {
  //       //   context.read<Counter>().decrement();
  //       // });
  //       // ScaffoldMessenger.of(context).showSnackBar(
  //       //   SnackBar(
  //       //     content: Text(
  //       //       'This Item was removed from Favorites',
  //       //     ),
  //       //     duration: Duration(seconds: 1),
  //       //     action: SnackBarAction(
  //       //       label: 'UNDO',
  //       //       onPressed: () {
  //       //         setState(() {
  //       //           context.read<Counter>().increment();
  //       //         });
  //       //       },
  //       //     ),
  //       //   ),
  //       // );
  //       //
  //       favList.add(productList[i]);
  //     }
  //     // else {
  //     //   setState(() {
  //     //     context.read<Counter>().increment();
  //     //   });
  //     //   ScaffoldMessenger.of(context).showSnackBar(
  //     //     SnackBar(
  //     //       content: Text('This Item was added to Favorites'),
  //     //       duration: Duration(seconds: 1),
  //     //       action: SnackBarAction(
  //     //         label: 'UNDO',
  //     //         onPressed: () {
  //     //           setState(() {
  //     //             context.read<Counter>().decrement();
  //     //           });
  //     //         },
  //     //       ),
  //     //     ),
  //     //   );
  //     // }
  //   }
  //   context.read<Counter>().setValue(favList.length);
  // }

  @override
  Widget build(BuildContext context) {
    productList = [...context.watch<ItemsFecth>().count];
    isInFavPage = [...context.watch<Counter>().listOfFavPage];
    isInCart = [...context.watch<CartCounter>().isinCart];
    context.watch<ItemsFecth>().count;
    return productList.isEmpty
        ? Center(child: CircularProgressIndicator())
        : GridView.count(
            childAspectRatio: 0.67,
            physics: NeverScrollableScrollPhysics(),
            // crossAxisSpacing: 2,
            // mainAxisSpacing: 2,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              for (int i = 0; i < productList.length; i++)
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
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
                            "${productList[i].discountPercentage}\%",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                            onTap: (() {
                              sendFav(productList[i].id, i);
                              // setState(() {
                              //   productList = [];
                              // });
                              //////////////////////////////////
                              ///Falaky UI
                              /////////////////////////////////
                              // if (productList[i].isFavorite = false) {
                              //   setState(() {
                              //     context.read<Counter>().increment();
                              //   });
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content:
                              //           Text('This Item was added to Favorites'),
                              //       duration: Duration(seconds: 1),
                              //       action: SnackBarAction(
                              //         label: 'UNDO',
                              //         onPressed: () {
                              //           setState(() {
                              //             context.read<Counter>().decrement();
                              //           });
                              //         },
                              //       ),
                              //     ),
                              //   );
                              // } else {
                              //   setState(() {
                              //     context.read<Counter>().decrement();
                              //   });
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text(
                              //         'This Item was removed from Favorites',
                              //       ),
                              //       duration: Duration(seconds: 1),
                              //       action: SnackBarAction(
                              //         label: 'UNDO',
                              //         onPressed: () {
                              //           setState(() {
                              //             context.read<Counter>().increment();
                              //           });
                              //         },
                              //       ),
                              //     ),
                              //   );
                              // }
                              // sendFav(productList[i].id);
                              // renderFav(favList.length);
                            }),
                            child:
                                isInFavPage.contains(productList[i].id) == true
                                    ? Icon(
                                        Icons.favorite,
                                        size: 25,
                                        color: Colors.red,
                                      )
                                    : Icon(
                                        Icons.favorite_outline,
                                        size: 25,
                                        color: Colors.red,
                                      ))
                      ],
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        customBorder: CircleBorder(),
                        splashColor: Color(0xFF4c53a5),
                        onTap: () => {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            Navigator.pushNamed(context, "/product",
                                arguments: {
                                  "id": productList[i].id,
                                  "name": productList[i].name,
                                  "thumbnail": productList[i].thumbnail,
                                  "description": productList[i].description,
                                  "price": productList[i].price,
                                  "fav": isInFavPage.contains(
                                    productList[i].id,
                                  ),
                                  "cart": isInCart.contains(productList[i].id)
                                });
                          })
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Image(
                            image: NetworkImage(productList[i].thumbnail),
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            strutStyle: StrutStyle(fontSize: 15.0),
                            text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4c53a5)),
                                text: productList[i].name!))),
                    Container(
                        padding: EdgeInsets.only(top: 5),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            strutStyle: StrutStyle(fontSize: 12.0),
                            text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 119, 119, 119)),
                                text: productList[i].description!))),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${productList[i].price!}",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4c53A5),
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              isInCart.contains(productList[i].id)
                                  ? removeCart(productList[i].id)
                                  : sendCart(productList[i].id);
                            },
                            child: !isInCart.contains(productList[i].id)
                                ? Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 25,
                                    color: Color(0xFF4c53A5),
                                  )
                                : Icon(
                                    Icons.shopping_bag,
                                    size: 25,
                                    color: Color(0xFF4c53A5),
                                  ),
                          )
                        ],
                      ),
                    )
                  ]),
                )
            ],
          );
  }

  @override
  void initState() {
    if (fetchFlag == false) {
      super.initState();
      fetchData();

      fetchFlag = true;
    }
  }
}
