class CategoriesList {
  String? name;

  CategoriesList({
    this.name,
  });

  factory CategoriesList.fromJsonData(Map<String, dynamic> data) {
    return CategoriesList(
      name: data['name'],
    );
  }
}
