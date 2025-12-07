part of 'bag_cubit.dart';

abstract class BagState {}

class BagInitial extends BagState {}

class BagLoading extends BagState {}

class BagSuccess extends BagState {
  final List<ProductModel> products;
  final BagModel bagModel;

  BagSuccess(this.products, this.bagModel);
}

class BagError extends BagState {
  final String message;

  BagError(this.message);
}
