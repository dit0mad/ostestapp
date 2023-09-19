class Category {
  final String category;

  Category({required this.category});

  static Category fromJson(String json) {
    return Category(category: json);
  }
}
