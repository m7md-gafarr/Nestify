import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/features/no_internet/logic/check_connection/check_connection_cubit.dart';
import 'package:depi_graduation_project/data/services/account_service/user_firestore_service.dart';
import 'package:depi_graduation_project/features/account/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  final CheckConnectionCubit connectionCubit;
  final UserFirestoreService userFirestoreService;

  GetUserDataCubit(this.connectionCubit, this.userFirestoreService)
    : super(GetUserDataInitial());

  UserModel? userData;

  Future<void> getUserData() async {
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(GetUserDataNoInternet());
      return;
    }

    emit(GetUserDataLoading());

    try {
      userData = await userFirestoreService.getUserData(
        FirebaseAuth.instance.currentUser!.uid,
      );
      emit(GetUserDataSuccess(userData!));
    } catch (e) {
      emit(GetUserDataFailure("Failed to get user data: $e"));
    }
  }
}
