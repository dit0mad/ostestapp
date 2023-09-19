import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/events.dart';
import 'package:ostestapp/blocs/interactive_bloc/state.dart';
import 'package:ostestapp/blocs/middleware_bloc/events.dart';
import 'package:ostestapp/blocs/middleware_bloc/state.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_events.dart';
import 'package:ostestapp/screens/detail_screen.dart';
import 'package:ostestapp/screens/item/item_detail.dart';

class MiddlewareBloc extends Bloc<MiddlewareEvents, MiddlewareState> {
  final NavigationBloc navigationBloc;
  final InteractiveBloc interactiveBloc;

  MiddlewareBloc({
    required this.navigationBloc,
    required this.interactiveBloc,
  }) : super(InitMiddlewareState()) {
    on<SetSubCategory>((event, emit) {
      navigationBloc.add(const PushPageRoute(
        page: MaterialPage(
          child: DetailScreen(),
        ),
        target: Target.mainStackMobile,
      ));

      interactiveBloc.state as InteractiveSuccess;

      interactiveBloc.add(ComputeSubCategory(
        mainCategory: event.mainCategory,
        subCategory: event.subCategory,
      ));
    });

    on<PopAndReset>((event, emit) {
      interactiveBloc.add(ResetCategory());

      navigationBloc.add(MaybePopRoute(
        target: Target.mainStackMobile,
        page: MaterialPage(child: Container()),
      ));
    });

    on<GoToItemDetail>((event, emit) {
      navigationBloc.add(const PushPageRoute(
        page: MaterialPage(child: ItemDetail()),
        target: Target.mainStackMobile,
      ));

      interactiveBloc.add(
        SetSelectedItem(item: event.item),
      );
    });
  }
}
