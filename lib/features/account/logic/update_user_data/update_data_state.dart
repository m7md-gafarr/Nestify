part of 'update_data_cubit.dart';

@immutable
sealed class UpdateDataState {}

final class UpdateDataInitial extends UpdateDataState {}

final class UpdateDataLoading extends UpdateDataState {}

final class UpdateDataSuccess extends UpdateDataState {}

final class UpdateDataFailure extends UpdateDataState {
  final String errorMessage;

  UpdateDataFailure(this.errorMessage);
}

final class UpdateDataNoInternet extends UpdateDataState {}
