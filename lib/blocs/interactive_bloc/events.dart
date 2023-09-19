import 'package:ostestapp/models/item.dart';

abstract class InteractiveEvent {
  const InteractiveEvent();
}

class LoadMenuItems extends InteractiveEvent {
  final List<Map<String, List<Item>>> data;

  const LoadMenuItems({required this.data});
}

class SetCategory extends InteractiveEvent {
  String category;

  SetCategory({required this.category});
}

class ComputeSubCategory extends InteractiveEvent {
  final String mainCategory;
  final String subCategory;

  const ComputeSubCategory(
      {required this.mainCategory, required this.subCategory});
}

class ResetCategory extends InteractiveEvent {}

class SetSelectedItem extends InteractiveEvent {
  final Item item;

  const SetSelectedItem({required this.item});
}
