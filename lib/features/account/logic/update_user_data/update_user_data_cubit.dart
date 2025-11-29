import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/core/utils/check_connection/check_connection_cubit.dart';
import 'package:depi_graduation_project/data/services/user_firestore_service.dart';
import 'package:depi_graduation_project/data/services/supabase_storage_service.dart';
import 'package:depi_graduation_project/features/account/models/user_model.dart';
import 'package:meta/meta.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  final CheckConnectionCubit connectionCubit;
  final UserFirestoreService userFirestoreService;
  final SupabaseStorageService storageService;

  UpdateUserDataCubit(
    this.connectionCubit,
    this.userFirestoreService,
    this.storageService,
  ) : super(UpdateUserDataInitial());

  Future<void> updateUserData({
    required UserModel user,
    File? newImageFile,
  }) async {
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(UpdateUserDataNoInternet());
      return;
    }

    emit(UpdateUserDataLoading());

    try {
      String? finalImageUrl = user.profileImageUrl;

      if (newImageFile != null) {
        if (user.profileImageUrl != null && user.profileImageUrl!.isNotEmpty) {
          await storageService.deleteImage(
            imageUrl: user.profileImageUrl!,
            folder: FirebaseCollection.users,
          );
        }

        finalImageUrl = await storageService.uploadImage(
          file: newImageFile,
          name: user.userId,
          folder: FirebaseCollection.users,
        );
      }

      await userFirestoreService.updateUserData(
        user.copyWith(profileImageUrl: finalImageUrl),
      );

      emit(UpdateUserDataSuccess());
    } catch (e) {
      emit(UpdateUserDataFailure("Failed to update user: $e"));
    }
  }
}
