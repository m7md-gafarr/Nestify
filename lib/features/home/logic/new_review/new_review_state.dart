part of 'new_review_cubit.dart';

@immutable
sealed class NewReviewState {}

final class NewReviewInitial extends NewReviewState {}

final class NewReviewLoading extends NewReviewState {}

final class NewReviewSuccess extends NewReviewState {}

final class NewReviewFailure extends NewReviewState {
  final String errorMessage;

  NewReviewFailure(this.errorMessage);
}
