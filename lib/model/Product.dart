class Product {
  String? name;
  int? userId;
  int? id;
  String? description;
  String? thumbnail;
  int? price;
  bool? isFavorite;

  Product(
      {this.name,
      this.userId,
      this.id,
      this.description,
      this.thumbnail,
      this.price,
      this.isFavorite});

  factory Product.fromJsonData(Map<String, dynamic> data) {
    return Product(
        description: data['description'],
        id: data['id'],
        userId: data['userId'],
        name: data['name'],
        thumbnail: data['thumbnail'],
        price: data['price'],
        isFavorite: data['isFavorite']);
  }
}
