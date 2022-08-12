class CateProducts {
  String? brand;
  List? products;

  CateProducts({
    this.brand,
    this.products,
  });

  factory CateProducts.fromJsonData(Map<String, dynamic> data) {
    return CateProducts(
      brand: data['brand'],
      products: data['products'],
    );
  }
}
