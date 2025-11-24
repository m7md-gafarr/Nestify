part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

final class LoginSuccess extends LoginState {
  LoginSuccess();
}

final class LoginNoInternet extends LoginState {}
