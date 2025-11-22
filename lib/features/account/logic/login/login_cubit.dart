import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/core/utils/check_connection/check_connection_cubit.dart';
import 'package:depi_graduation_project/data/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final CheckConnectionCubit connectionCubit;
  LoginCubit(this.connectionCubit) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(LoginNoInternet());
      return;
    }

    emit(LoginLoading());
    try {
      AuthService authService = AuthService();
      final credential = await authService.login(email, password);
      if (!credential!.user!.emailVerified) {
        emit(LoginFailure('Please verify your email before logging in.'));
        return;
      }
      emit(LoginSuccess(credential));
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-credential") {
        emit(LoginFailure("Invalid email or password."));
      } else if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Wrong password provided for that user.'));
      } else if (e.code == 'invalid-email') {
        emit(LoginFailure('Invalid email address.'));
      } else if (e.code == 'too-many-requests') {
        emit(LoginFailure('Too many attempts. Please try again later.'));
      } else if (e.code == 'network-request-failed') {
        emit(LoginFailure('Network error. Check your connection.'));
      } else {
        emit(LoginFailure('Authentication failed. Please try again.'));
      }
    } catch (e) {
      emit(LoginFailure('An unknown error occurred.'));
    }
  }
}
