part of 'complete_add_data_cubit.dart';

@immutable
sealed class CompleteAddDataState {}

final class CompleteAddDataInitial extends CompleteAddDataState {}

final class CompleteAddDataLoading extends CompleteAddDataState {}

final class CompleteAddDataSuccess extends CompleteAddDataState {
  CompleteAddDataSuccess();
}

final class CompleteAddDataFailure extends CompleteAddDataState {
  final String errorMessage;
  CompleteAddDataFailure(this.errorMessage);
}

final class CompleteAddDataNoInternet extends CompleteAddDataState {}
