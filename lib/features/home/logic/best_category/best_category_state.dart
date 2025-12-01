part of 'best_category_cubit.dart';

@immutable
abstract class BestCategoryState {}

class BestCategoryLoading extends BestCategoryState {}

class BestCategorySuccess extends BestCategoryState {
  final List<BestCategoryModel> list;
  BestCategorySuccess(this.list);
}

class BestCategoryAdded extends BestCategoryState {}

class BestCategoryError extends BestCategoryState {
  final String message;
  BestCategoryError(this.message);
}
