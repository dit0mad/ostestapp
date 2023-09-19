import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_events.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavState> {
  final List<MaterialPage<dynamic>> mobileStack;

  NavigationBloc({
    required this.mobileStack,
  }) : super(
          MainStackState(
            mainStackMobile: mobileStack,
          ),
        ) {
    on<MaybePopRoute>((event, emit) {
      final target = event.target;

      final nextState = navReducer(event, target, state as MainStackState);

      emit(nextState);
    });

    on<PushPageRoute>((event, emit) {
      final target = event.target;

      final nextState = navReducer(event, target, state as MainStackState);

      emit(nextState);
    });

    on<PopToRootPushPageRoute>((event, emit) {
      final target = event.target;

      final nextState = navReducer(event, target, state as MainStackState);

      emit(nextState);
    });
  }
}

abstract class NavState {
  const NavState();
}
