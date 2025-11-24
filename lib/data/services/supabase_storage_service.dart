import 'dart:io';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<String?> uploadImage({
    required File file,
    required String userId,
  }) async {
    try {
      final fileExt = file.path.split('.').last;
      final fileName =
          "$userId-${DateTime.now().millisecondsSinceEpoch}.$fileExt";
      final filePath = fileName;

      final fileBytes = await file.readAsBytes();

      await Supabase.instance.client.storage
          .from(FirebaseCollection.users)
          .uploadBinary(
            filePath,
            fileBytes,
            fileOptions: FileOptions(contentType: "image/$fileExt"),
          );

      return Supabase.instance.client.storage
          .from(FirebaseCollection.users)
          .getPublicUrl(filePath);
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteImage(String filePath) async {
    final bucket = _client.storage.from('users');
    await bucket.remove([filePath]);
    return true;
  }
}
