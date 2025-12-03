import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/home_service/review_service.dart';
import 'package:depi_graduation_project/features/home/models/product/review_model.dart';
import 'package:meta/meta.dart';

part 'new_review_state.dart';

class NewReviewCubit extends Cubit<NewReviewState> {
  NewReviewCubit() : super(NewReviewInitial());

  Future<void> newReview({
    required String productId,
    required ReviewModel review,
  }) async {
    emit(NewReviewLoading());
    try {
      await ReviewService().addReviewWithUserId(
        productId: productId,
        review: review,
      );

      emit(NewReviewSuccess());
    } catch (e) {
      emit(NewReviewFailure(e.toString()));
    }
  }
}
