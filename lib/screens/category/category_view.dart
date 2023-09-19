import 'package:flutter/material.dart';
import 'package:ostestapp/screens/category/category_tab.dart';

class CatergoryView extends StatelessWidget {
  const CatergoryView({
    super.key,
    required ScrollController scrollController,
    required this.category,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<String> category;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        color: Colors.black,
        child: Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...category.map(
                  (e) => CategoryTab(category: e),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
