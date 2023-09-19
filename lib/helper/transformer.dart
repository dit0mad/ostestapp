//lets simulate http get and transform json to objects.

import 'package:ostestapp/models/item.dart';

List<Map<String, List<Item>>> jsonToCategoryItem(
  final Map<String, dynamic> json,
) {
  try {
    final modifierSetsFromID = json.entries
        .map(
          (final e) => {
            e.key: Item.fromJson(e.value),
          },
        )
        .toList();

    return modifierSetsFromID;
  } catch (e) {
    rethrow;
  }
}
