import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/firestore_home_service.dart';
import 'package:depi_graduation_project/features/home/model/room_model.dart';

part 'rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  StreamSubscription? _subscription;

  RoomsCubit() : super(RoomsLoading());

  void listenToRooms() {
    emit(RoomsLoading());

    _subscription = FirestoreHomeService().getRoomsStream().listen(
      (rooms) {
        emit(RoomsSuccess(rooms));
      },
      onError: (error) {
        emit(RoomsError('Failed to load rooms: $error'));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
