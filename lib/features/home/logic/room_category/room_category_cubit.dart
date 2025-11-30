import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/home_service/room_category_service.dart';
import 'package:depi_graduation_project/features/home/model/categories/room_category_model.dart';
import 'package:meta/meta.dart';

part 'room_category_state.dart';

class RoomCategoryCubit extends Cubit<RoomCategoryState> {
  StreamSubscription? _subscription;

  RoomCategoryCubit() : super(RoomCategoryLoading());

  void listenToRoomCategories({required String roomId}) {
    emit(RoomCategoryLoading());

    _subscription = RoomCategoryService()
        .getRoomCategoriesStream(roomId)
        .listen(
          (roomCategories) {
            emit(RoomCategorySucess(roomCategories));
          },
          onError: (error) {
            emit(RoomCategoryError('Failed to load room categories: $error'));
          },
        );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
