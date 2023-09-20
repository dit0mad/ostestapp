import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/events.dart';
import 'package:ostestapp/blocs/interactive_bloc/state.dart';
import 'package:ostestapp/models/item.dart';

class InteractiveBloc extends Bloc<InteractiveEvent, InteractiveState> {
  List<Map<String, List<Item>>>? _data;
  List<String>? _categories;
  Iterable<Item>? _allItems;

  InteractiveBloc()
      : super(
          InitInteractiveState(),
        ) {
    on<LoadMenuItems>((event, emit) {
      _data = event.data;

      _categories = _data!.expand((element) => element.keys).toList();

      emit(
        InteractiveSuccess(
          selectedCategory: _categories!.first,
          items: _data!.first.entries.first.value,
          categories: _categories!,
        ),
      );
    });

    on<SetCategory>((event, emit) {
      final prevState = state as InteractiveSuccess;

      _allItems = _data!
          .where((element) => element.containsKey(event.category))
          .first
          .values
          .expand((element) => element);

      final nextState = prevState.copyWith(
        items: _allItems!.toList(),
        selectedCategory: event.category,
      );

      emit(nextState);
    });

    on<ComputeSubCategory>((event, emit) {
      final mainCat = event.mainCategory;
      final subCat = event.subCategory;

      final prevState = state as InteractiveSuccess;

      final hasSubcat = _allItems!.where((e) => e.option == subCat).toList();

      final nextState = prevState.copyWith(
        items: hasSubcat.toList(),
        selectedCategory: mainCat,
      );

      emit(nextState);
    });

    on<ResetCategory>((event, emit) {
      final prevState = state as InteractiveSuccess;

      _allItems = _data!
          .where((element) => element.containsKey(prevState.selectedCategory))
          .first
          .values
          .expand((element) => element);

      emit(prevState.copyWith(
        selectedCategory: prevState.selectedCategory,
        items: _allItems!.toList(),
        categories: _categories!,
      ));
    });

    on<SetSelectedItem>((event, emit) {
      final prevState = state as InteractiveSuccess;

      final nexState = prevState.copyWith(selectedItem: event.item);

      emit(nexState);
    });
  }
}
