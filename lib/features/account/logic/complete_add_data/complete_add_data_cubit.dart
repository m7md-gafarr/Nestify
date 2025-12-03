import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/features/no_internet/logic/check_connection/check_connection_cubit.dart';
import 'package:depi_graduation_project/data/services/account_service/user_firestore_service.dart';
import 'package:depi_graduation_project/features/account/models/user_model.dart';
import 'package:meta/meta.dart';

part 'complete_add_data_state.dart';

class CompleteAddDataCubit extends Cubit<CompleteAddDataState> {
  final CheckConnectionCubit connectionCubit;
  final UserFirestoreService userFirestoreService;

  CompleteAddDataCubit(this.connectionCubit, this.userFirestoreService)
    : super(CompleteAddDataInitial());

  completeAddData(UserModel model) async {
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(CompleteAddDataNoInternet());
      return;
    }

    emit(CompleteAddDataLoading());
    try {
      await userFirestoreService.saveUserData(model);
      emit(CompleteAddDataSuccess());
    } catch (e) {
      emit(CompleteAddDataFailure('Failed to complete adding data: $e'));
    }
  }
}
