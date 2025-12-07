import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/data/services/account_service/auth_service.dart';
import 'package:depi_graduation_project/data/services/account_service/user_firestore_service.dart';
import 'package:depi_graduation_project/features/no_internet/logic/check_connection/check_connection_cubit.dart';
import 'package:meta/meta.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final CheckConnectionCubit connectionCubit;
  ForgotPasswordCubit(this.connectionCubit) : super(ForgotPasswordInitial());

  Future<void> forgotPassword({required String email}) async {
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(ForgotPasswordNoInternet());
      return;
    }

    emit(ForgotPasswordLoading());

    try {
      final exists = await UserFirestoreService().isUserExistByEmail(email);
      if (!exists) {
        emit(ForgotPasswordFailure("No user found with this email."));
        return;
      }

      // 2: Now send reset email
      await AuthService().forgotPassword(email);

      emit(ForgotPasswordSuccess());
    } catch (e) {
      emit(ForgotPasswordFailure("Something went wrong, please try again."));
    }
  }
}
