part of 'best_product_cubit.dart';

@immutable
sealed class BestProductState {}

final class BestProductInitial extends BestProductState {}

final class BestProductLoading extends BestProductState {}

final class BestProductSuccess extends BestProductState {
  final List<ProductModel> products;

  BestProductSuccess(this.products);
}

final class BestProductError extends BestProductState {
  final String message;

  BestProductError(this.message);
}
