import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/data_bloc/data_bloc.dart';
import 'package:ostestapp/blocs/data_bloc/data_events.dart';
import 'package:ostestapp/blocs/data_bloc/data_state.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DataStateBloc, DataState>(builder: (context, state) {
        if (state is DataLoadedState) {
          return Row(
            children: [
              const Text('dataloaded'),
              TextButton(
                  onPressed: () => BlocProvider.of<DataStateBloc>(context).add(
                        const GetData(),
                      ),
                  child: const Text("GetDAra"))
            ],
          );
        }
        return Row(
          children: [
            const Text('Initializing here'),
            TextButton(
                onPressed: () => BlocProvider.of<DataStateBloc>(context).add(
                      const GetData(),
                    ),
                child: const Text("GetDAra"))
          ],
        );
      }),
    );
  }
}

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
