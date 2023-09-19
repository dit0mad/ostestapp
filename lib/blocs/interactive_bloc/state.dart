import 'package:ostestapp/models/item.dart';

abstract class InteractiveState {}

class InitInteractiveState extends InteractiveState {}

class InteractiveSuccess extends InteractiveState {
  final List<Item> items;

  final String selectedCategory;

  final List<String> categories;

  final Item? selectedItem;

  InteractiveSuccess(
      {required this.selectedCategory,
      required this.items,
      required this.categories,
      this.selectedItem});

  InteractiveSuccess copyWith({
    final List<Item>? items,
    final String? selectedCategory,
    final List<String>? categories,
    final Item? selectedItem,
  }) {
    return InteractiveSuccess(
      categories: categories ?? this.categories,
      items: items ?? this.items,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedItem: selectedItem,
    );
  }
}
