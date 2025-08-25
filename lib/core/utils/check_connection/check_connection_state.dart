part of 'check_connection_cubit.dart';

@immutable
abstract class CheckConnectionState {}

class CheckConnectionLoading extends CheckConnectionState {}

class CheckConnectionHasInternet extends CheckConnectionState {}

class CheckConnectionNoInternet extends CheckConnectionState {}
