class Product {
  String? name;
  int? userId;
  String? id;
  String? description;
  String? thumbnail;
  int? price;
  bool? isFavorite;
  int? discountPercentage;
  String? category;

  Product(
      {this.name,
      this.userId,
      this.id,
      this.description,
      this.thumbnail,
      this.price,
      this.isFavorite,
      this.discountPercentage,
      this.category});

  factory Product.fromJsonData(Map<String, dynamic> data) {
    return Product(
        description: data['description'],
        id: data['_id'],
        userId: data['userId'],
        name: data['name'],
        thumbnail: data['thumbnail'],
        price: data['price'],
        isFavorite: data['isFavorite'],
        discountPercentage: data['discountPercentage'],
        category: data['category']);
  }
}
