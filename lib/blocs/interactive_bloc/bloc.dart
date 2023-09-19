import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostestapp/blocs/interactive_bloc/events.dart';
import 'package:ostestapp/blocs/interactive_bloc/state.dart';
import 'package:ostestapp/models/item.dart';

class InteractiveBloc extends Bloc<InteractiveEvent, InteractiveState> {
  List<Map<String, List<Item>>>? data;
  List<String>? categories;
  Iterable<Item>? allItems;

  InteractiveBloc()
      : super(
          InitInteractiveState(),
        ) {
    on<LoadMenuItems>((event, emit) {
      data = event.data;

      categories = data!.expand((element) => element.keys).toList();

      emit(
        InteractiveSuccess(
          selectedCategory: categories!.first,
          items: data!.first.entries.first.value,
          categories: categories!,
        ),
      );
    });

    on<SetCategory>((event, emit) {
      final prevState = state as InteractiveSuccess;

      allItems = data!
          .where((element) => element.containsKey(event.category))
          .first
          .values
          .expand((element) => element);

      final nextState = prevState.copyWith(
        items: allItems!.toList(),
        selectedCategory: event.category,
      );

      emit(nextState);
    });

    on<ComputeSubCategory>((event, emit) {
      final mainCat = event.mainCategory;
      final subCat = event.subCategory;

      final prevState = state as InteractiveSuccess;

      final hasSubcat = allItems!.where((e) => e.option == subCat).toList();

      final nextState = prevState.copyWith(
        items: hasSubcat.toList(),
        selectedCategory: mainCat,
      );

      emit(nextState);
    });

    on<ResetCategory>((event, emit) {
      final prevState = state as InteractiveSuccess;

      allItems = data!
          .where((element) => element.containsKey(prevState.selectedCategory))
          .first
          .values
          .expand((element) => element);

      emit(prevState.copyWith(
        selectedCategory: prevState.selectedCategory,
        items: allItems!.toList(),
        categories: categories!,
      ));
    });

    on<SetSelectedItem>((event, emit) {
      final prevState = state as InteractiveSuccess;

      final nexState = prevState.copyWith(selectedItem: event.item);

      emit(nexState);
    });
  }
}
