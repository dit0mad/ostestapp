import 'package:ostestapp/models/item.dart';

abstract class MiddlewareEvents {
  const MiddlewareEvents();
}

class SetSubCategory extends MiddlewareEvents {
  final String mainCategory;
  final String subCategory;

  const SetSubCategory({required this.mainCategory, required this.subCategory});
}

class PopAndReset extends MiddlewareEvents {
  const PopAndReset();
}

class GoToItemDetail extends MiddlewareEvents {
  final Item item;
  const GoToItemDetail({required this.item});
}
