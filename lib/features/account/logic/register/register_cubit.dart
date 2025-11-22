import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/core/utils/check_connection/check_connection_cubit.dart';
import 'package:depi_graduation_project/data/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final CheckConnectionCubit connectionCubit;
  RegisterCubit(this.connectionCubit) : super(RegisterInitial());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(RegisterNoInternet());
      return;
    }
    emit(RegisterLoading());
    try {
      AuthService authService = AuthService();
      final credential = await authService.register(email, password);
      await _auth.currentUser!.sendEmailVerification();
      emit(RegisterSuccess(credential!));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          emit(RegisterFailure('The password provided is too weak.'));
          break;
        case 'email-already-in-use':
          emit(RegisterFailure('The account already exists for that email.'));
          break;
        case 'invalid-email':
          emit(RegisterFailure('Email address is invalid.'));
          break;
        default:
          emit(RegisterFailure('Authentication error: ${e.code}'));
      }
    } catch (e) {
      emit(RegisterFailure('An unknown error occurred'));
    }
  }
}
