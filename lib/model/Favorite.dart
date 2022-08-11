class Favorite {
  bool? isFavorite;

  Favorite({this.isFavorite});

  factory Favorite.fromJsonData(Map<dynamic, dynamic> data) {
    return Favorite(isFavorite: data['isFavorite']);
  }
}
