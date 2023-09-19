import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/state.dart';
import 'package:ostestapp/blocs/middleware_bloc/bloc.dart';
import 'package:ostestapp/blocs/middleware_bloc/events.dart';
import 'package:ostestapp/screens/item/single_item.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InteractiveBloc, InteractiveState>(
      builder: (context, state) {
        if (state is InteractiveSuccess) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                leading: BackButton(
                  onPressed: () {
                    BlocProvider.of<MiddlewareBloc>(context)
                        .add(const PopAndReset());
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ...state.items.map(
                      (e) => SingleItem(
                        item: e,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Ink();
      },
    );
  }
}
