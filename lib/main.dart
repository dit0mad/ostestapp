import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ostestapp/blocs/data_bloc/data_bloc.dart';
import 'package:ostestapp/blocs/data_bloc/data_events.dart';
import 'package:ostestapp/blocs/data_bloc/data_state.dart';
import 'package:ostestapp/blocs/interactive_bloc/bloc.dart';
import 'package:ostestapp/blocs/middleware_bloc/bloc.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_events.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_state.dart';
import 'package:ostestapp/observer.dart';
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

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const ViewerBlocObserver();

  runApp(MultiBlocProvider(
    providers: [
      ...providers,
    ],
    child: const Entry(),
  ));
}

//entry class can be figured to add different pages for different screen sizes.

class Entry extends StatelessWidget {
  const Entry({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: MaterialApp(home: MobileScreen()));
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavState>(builder: (
      context,
      state,
    ) {
      if (state is MainStackState) {
        return Navigator(
          key: mainNavigatorKey,
          onPopPage: (final Route<dynamic> route, final dynamic result) {
            return route.didPop(result);
          },
          pages: [
            ...state.mainStackMobile,
          ],
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
