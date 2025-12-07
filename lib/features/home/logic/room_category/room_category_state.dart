part of 'room_category_cubit.dart';

@immutable
sealed class RoomCategoryState {}

final class RoomCategoryInitial extends RoomCategoryState {}

final class RoomCategoryLoading extends RoomCategoryState {}

final class RoomCategorySucess extends RoomCategoryState {
  final List<RoomCategoryModel> roomCategories;
  RoomCategorySucess(this.roomCategories);
}

final class RoomCategoryError extends RoomCategoryState {
  final String message;
  RoomCategoryError(this.message);
}
