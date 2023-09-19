import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/state.dart';
import 'package:ostestapp/blocs/middleware_bloc/bloc.dart';
import 'package:ostestapp/blocs/middleware_bloc/events.dart';
import 'package:ostestapp/screens/item/single_item.dart';

class ItemView extends StatelessWidget {
  const ItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InteractiveBloc, InteractiveState>(
      builder: (context, state) {
        if (state is InteractiveSuccess) {
          final hasSubcat = state.items.where((e) => e.option != null);

          if (hasSubcat.isNotEmpty) {
            final options = hasSubcat.map((e) => e.option).toSet();

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...options.map(
                  (option) => TextButton(
                    onPressed: () {
                      BlocProvider.of<MiddlewareBloc>(context).add(
                        SetSubCategory(
                          mainCategory: state.selectedCategory,
                          subCategory: option,
                        ),
                      );
                    },
                    child: Ink(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        option!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                ...state.items.map(
                  (e) => SingleItem(
                    item: e,
                  ),
                ),
              ],
            ),
          );
        }

        return Ink();
      },
    );
  }
}
