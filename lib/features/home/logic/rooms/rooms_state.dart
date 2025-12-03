part of 'rooms_cubit.dart';

abstract class RoomsState {}

class RoomsLoading extends RoomsState {}

class RoomsSuccess extends RoomsState {
  final List<RoomModel> list;
  RoomsSuccess(this.list);
}

class RoomsError extends RoomsState {
  final String message;
  RoomsError(this.message);
}
