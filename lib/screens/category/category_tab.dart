import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/events.dart';
import 'package:ostestapp/blocs/interactive_bloc/state.dart';

class CategoryTab extends StatelessWidget {
  final String category;
  const CategoryTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InteractiveBloc, InteractiveState>(
        builder: (context, state) {
      state as InteractiveSuccess;

      final selectedTab = state.selectedCategory;
      return DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () => {
              BlocProvider.of<InteractiveBloc>(context)
                  .add(SetCategory(category: category)),
            },
            child: Ink(
                decoration: BoxDecoration(
                  color: selectedTab == category ? Colors.red : Colors.white10,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(category)),
          ),
        ),
      );
    });
  }
}
