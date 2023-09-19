import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_events.dart';

class MainStackState extends NavState {
  final List<MaterialPage> mainStackMobile;

  const MainStackState({
    required this.mainStackMobile,
  });

  MainStackState copyWith({
    final List<MaterialPage>? mainStackMobile,
    final List<MaterialPage>? mainStackTablet,
  }) =>
      MainStackState(
        mainStackMobile: mainStackMobile ?? this.mainStackMobile,
      );
}

MainStackState navReducer(
  final NavigationEvent event,
  final Target target,
  final MainStackState state,
) {
  if (target == Target.mainStackMobile) {
    final nextStack = reduce(event, state.mainStackMobile);

    final nextState = state.copyWith(
      mainStackMobile: nextStack,
    );

    return nextState;
  }

  return state;
}

List<MaterialPage<dynamic>> reduce(
  final NavigationEvent event,
  final List<MaterialPage> stack,
) {
  if (event is MaybePopRoute) {
    final next = [...stack.sublist(0, max(1, stack.length - 1))];

    return next;
  }
  if (event is PopToRootPushPageRoute) {
    final next = [
      ...stack.sublist(0, 1),
      event.page,
    ];
    return next;
  }

  if (event is PushPageRoute) {
    final next = [
      ...stack,
      event.page,
    ];
    return next;
  }

  return stack;
}
