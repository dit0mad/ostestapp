import 'package:flutter/material.dart';

class Target {
  final String _value;

  String get value => _value;

  const Target._string(this._value);

  static const Target mainStackMobile = Target._string('mainStackMobile');
}

sealed class NavigationEvent {
  final Target target;
  final MaterialPage page;
  const NavigationEvent({required this.page, required this.target});
}

class PushPageRoute extends NavigationEvent {
  const PushPageRoute({
    required super.page,
    required super.target,
  });
}

class PopToRootPushPageRoute extends NavigationEvent {
  const PopToRootPushPageRoute({
    required super.page,
    required super.target,
  });
}

class MaybePopRoute extends NavigationEvent {
  final Function(Route, Route?)? done;
  final bool sideEffect;

  @override
  MaybePopRoute({
    required super.page,
    required super.target,
    this.done,
    this.sideEffect = false,
  });
}
