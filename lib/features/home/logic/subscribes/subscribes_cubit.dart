import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/home_service/subscribe_service.dart';
import 'package:meta/meta.dart';

part 'subscribes_state.dart';

class SubscribesCubit extends Cubit<SubscribesState> {
  SubscribesCubit() : super(SubscribesInitial());

  Future<void> newReview({
    required String userId,
    required String email,
  }) async {
    emit(SubscribesLoading());
    try {
      await SubscribeService().addSubscriberWithUserId(
        userId: userId,
        email: email,
      );

      emit(SubscribesSuccess());
    } catch (e) {
      emit(SubscribesFailure(e.toString()));
    }
  }
}
