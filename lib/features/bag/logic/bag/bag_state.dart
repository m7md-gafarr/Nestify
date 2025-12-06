part of 'bag_cubit.dart';

@immutable
abstract class BagState {}

class BagInitial extends BagState {}

class BagLoading extends BagState {}

class BagLoaded extends BagState {
  final List<BagItem> items;
  final String promo;
  final double subtotal;
  final double discount;
  final double total;

  BagLoaded({
    required this.items,
    required this.promo,
    required this.subtotal,
    required this.discount,
    required this.total,
  });
}

class BagError extends BagState {
  final String message;
  BagError(this.message);
}

