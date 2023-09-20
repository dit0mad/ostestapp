import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:ostestapp/blocs/navigation_bloc/navigation_state.dart';
import 'package:ostestapp/observer.dart';
import 'package:ostestapp/providers.dart';

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

//entry class can be figured to add different pages for different screen sizes. As per requirement its default to mobile screen.

class Entry extends StatelessWidget {
  const Entry({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: MaterialApp(home: MobileScreen()));
  }
}

//main entry point for mobile screen
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
