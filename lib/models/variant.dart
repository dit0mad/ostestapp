class Variant {
  String label;
  double price;

  Variant({required this.label, required this.price});

  static List<Variant> fromJson(final Map<String, double> variantJson) {
    final List<Variant> variantList = [];

    variantJson.forEach((key, value) {
      variantList.add(Variant(label: key, price: value));
    });

    return variantList;
  }
}
