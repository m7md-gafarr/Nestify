part of 'subscribes_cubit.dart';

@immutable
sealed class SubscribesState {}

final class SubscribesInitial extends SubscribesState {}

final class SubscribesLoading extends SubscribesState {}

final class SubscribesSuccess extends SubscribesState {
  SubscribesSuccess();
}

final class SubscribesFailure extends SubscribesState {
  final String errorMessage;

  SubscribesFailure(this.errorMessage);
}
