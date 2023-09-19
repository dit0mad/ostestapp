import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/data_bloc/data_events.dart';
import 'package:ostestapp/blocs/data_bloc/data_state.dart';
import 'package:ostestapp/dummy_data/data_set.dart';
import 'package:ostestapp/helper/transformer.dart';
import 'package:ostestapp/blocs/interactive_bloc/bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/events.dart';

class DataStateBloc extends Bloc<ApiEvents, DataState> {
  final InteractiveBloc interactiveBloc;

  DataStateBloc({required this.interactiveBloc})
      : super(
          const InitDataState(),
        ) {
    on<GetData>((event, emit) {
      final data = jsonToCategoryItem(dataSet).toList();

      emit(
        DataLoadedState(dataSet: data),
      );

      interactiveBloc.add(LoadMenuItems(data: data));
    });
  }
}
