import 'package:ecommerce/model/Product.dart';

class Brands {
  String? brand;
  String? thumbnail;

  Brands({
    this.brand,
    this.thumbnail,
  });

  factory Brands.fromJsonData(Map<String, dynamic> data) {
    return Brands(
      brand: data['brand'],
      thumbnail: data['thumbnail'],
    );
  }
}
