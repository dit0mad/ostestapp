import 'variant.dart';

class Item {
  final int id;
  final String name;
  final String? option;
  final List<Variant> variant;

  Item({
    required this.id,
    required this.name,
    required this.variant,
    this.option,
  });

//we gurantee the list is populated.
  static List<Item> fromJson(List<Map<String, dynamic>> json) {
    final List<Item> itemList = [];

    for (final Map<String, dynamic> list in json) {
      final id = list['id'];
      final name = list['name'];
      final variant = Variant.fromJson(list['variant']);
      final option = list['subcategroy'];

      itemList.add(
        Item(
          id: id,
          name: name,
          variant: variant,
          option: option,
        ),
      );
    }

    return itemList;
  }
}
