part of 'saved_items_cubit.dart';

@immutable
abstract class SavedItemsState {}

class SavedItemsInitial extends SavedItemsState {}

class SavedItemsLoading extends SavedItemsState {}

class SavedItemsLoaded extends SavedItemsState {
  final List<ProductModel> savedItems;
  SavedItemsLoaded(this.savedItems);
}

class SavedItemsError extends SavedItemsState {
  final String message;
  SavedItemsError(this.message);
}
