part of 'get_user_data_cubit.dart';

@immutable
sealed class GetUserDataState {}

final class GetUserDataInitial extends GetUserDataState {}

final class GetUserDataLoading extends GetUserDataState {}

final class GetUserDataSuccess extends GetUserDataState {
  final UserModel userModel;

  GetUserDataSuccess(this.userModel);
}

final class GetUserNotLoggedIn extends GetUserDataState {}

final class GetUserDataFailure extends GetUserDataState {
  final String errorMessage;

  GetUserDataFailure(this.errorMessage);
}

final class GetUserDataNoInternet extends GetUserDataState {}
