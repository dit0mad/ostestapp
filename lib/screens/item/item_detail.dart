import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/state.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_events.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(
          onPressed: () {
            BlocProvider.of<NavigationBloc>(context).add(
              MaybePopRoute(
                page: MaterialPage(
                  child: Container(),
                ),
                target: Target.mainStackMobile,
              ),
            );
          },
        ),
      ),
      body: BlocBuilder<InteractiveBloc, InteractiveState>(
          builder: (context, state) {
        if (state is InteractiveSuccess) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  state.selectedItem!.name,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              if (state.selectedItem!.variant.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ...state.selectedItem!.variant.map((e) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: RichText(
                                    text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  children: [
                                    TextSpan(text: e.label),
                                    const WidgetSpan(
                                        child: SizedBox(
                                      width: 2,
                                    )),
                                    const TextSpan(text: ":"),
                                    const WidgetSpan(
                                        child: SizedBox(
                                      width: 2,
                                    )),
                                    TextSpan(text: '\$${e.price}'),
                                  ],
                                )),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
            ],
          );
        }

        return const Material();
      }),
    );
  }
}
