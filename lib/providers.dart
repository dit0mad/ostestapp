import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/data_bloc/data_bloc.dart';
import 'package:ostestapp/blocs/data_bloc/data_events.dart';
import 'package:ostestapp/blocs/data_bloc/data_state.dart';
import 'package:ostestapp/blocs/interactive_bloc/bloc.dart';
import 'package:ostestapp/blocs/middleware_bloc/bloc.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_events.dart';
import 'package:ostestapp/screens/home/home_screen.dart';
import 'package:ostestapp/screens/init_screen.dart';

final providers = [
  BlocProvider(
    create: (_) => InteractiveBloc(),
  ),
  BlocProvider(
    create: (_) =>
        DataStateBloc(interactiveBloc: BlocProvider.of<InteractiveBloc>(_))
          ..add(const GetData()),
  ),
  BlocProvider(
    create: (_) => NavigationBloc(
      mobileStack: [
        const MaterialPage(child: InitPage()),
      ],
    ),
  ),
  BlocProvider(
    create: (context) => MiddlewareBloc(
      interactiveBloc: BlocProvider.of<InteractiveBloc>(context),
      navigationBloc: BlocProvider.of<NavigationBloc>(context),
    ),
  ),
  BlocListener<DataStateBloc, DataState>(
    listener: (context, state) {
      if (state is DataLoadedState) {
        BlocProvider.of<NavigationBloc>(context).add(const PushPageRoute(
            page: MaterialPage(child: Home()), target: Target.mainStackMobile));
      }
    },
  ),
];
