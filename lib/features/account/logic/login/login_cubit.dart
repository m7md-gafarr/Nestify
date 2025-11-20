import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/core/utils/check_connection/check_connection_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final CheckConnectionCubit connectionCubit;
  LoginCubit(this.connectionCubit) : super(LoginInitial());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(LoginNoInternet());
      return;
    }

    emit(LoginLoading());
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(LoginSuccess(credential));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Wrong password provided for that user.'));
      } else {
        emit(LoginFailure('Authentication failed. Please try again.'));
      }
    } catch (e) {
      emit(LoginFailure('An unknown error occurred'));
    }
  }
}
