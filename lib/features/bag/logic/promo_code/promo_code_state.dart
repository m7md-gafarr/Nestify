part of 'promo_code_cubit.dart';

@immutable
abstract class PromoCodeState {}

class PromoCodeInitial extends PromoCodeState {}

class PromoCodeLoading extends PromoCodeState {}

class PromoCodeLoaded extends PromoCodeState {
  final PromoCodeModel code;
  final double discount;
  PromoCodeLoaded(this.code, this.discount);
}

class PromoCodeError extends PromoCodeState {
  final String message;
  PromoCodeError(this.message);
}
