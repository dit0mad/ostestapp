import 'package:ostestapp/models/item.dart';

abstract class DataState {
  const DataState();
}

class InitDataState extends DataState {
  const InitDataState();
}

class DataLoadedState extends DataState {
  final List<Map<String, List<Item>>> dataSet;

  DataLoadedState({
    required this.dataSet,
  });

  DataLoadedState copyWith({final List<Map<String, List<Item>>>? dataSet}) =>
      DataLoadedState(
        dataSet: dataSet ?? this.dataSet,
      );
}
