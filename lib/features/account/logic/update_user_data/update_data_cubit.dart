import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/core/utils/check_connection/check_connection_cubit.dart';
import 'package:depi_graduation_project/data/services/user_firestore_service.dart';
import 'package:depi_graduation_project/features/account/models/user_model.dart';
import 'package:meta/meta.dart';

part 'update_data_state.dart';

class UpdateDataCubit extends Cubit<UpdateDataState> {
  final CheckConnectionCubit connectionCubit;
  final UserFirestoreService userFirestoreService;

  UpdateDataCubit(this.connectionCubit, this.userFirestoreService)
    : super(UpdateDataInitial());

  Future<void> updateUserData(UserModel userData) async {
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(UpdateDataNoInternet());
      return;
    }

    emit(UpdateDataLoading());

    try {
      await userFirestoreService.updateUserData(userData);

      emit(UpdateDataSuccess());
    } catch (e) {
      emit(UpdateDataFailure("Failed to update user: $e"));
    }
  }
}
