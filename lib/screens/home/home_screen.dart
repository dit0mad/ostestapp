import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/data_bloc/data_bloc.dart';
import 'package:ostestapp/blocs/data_bloc/data_state.dart';
import 'package:ostestapp/screens/category/category_view.dart';
import 'package:ostestapp/screens/item/item_view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return Scaffold(
      body: BlocBuilder<DataStateBloc, DataState>(
        builder: (context, state) {
          if (state is DataLoadedState) {
            final category =
                state.dataSet.expand((element) => element.keys).toList();

            return Material(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                      child: Center(
                          child: Text(
                    "MENU",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 20),
                  ))),
                  CatergoryView(
                    scrollController: _scrollController,
                    category: category,
                  ),
                  const Expanded(child: ItemView()),
                ],
              ),
            );
          }

          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}
