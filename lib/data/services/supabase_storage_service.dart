import 'dart:io';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<String?> uploadImage({
    required File file,
    required String userId,
  }) async {
    final bucket = _client.storage.from(FirebaseCollection.users);

    final filePath =
        'profiles/$userId-${DateTime.now().millisecondsSinceEpoch}.jpg';

    final uploadResult = await bucket.upload(
      filePath,
      file,
      fileOptions: const FileOptions(upsert: true),
    );

    if (uploadResult.isNotEmpty) {
      final publicUrl = bucket.getPublicUrl(filePath);
      return publicUrl;
    }

    return null;
  }

  Future<bool> deleteImage(String filePath) async {
    final bucket = _client.storage.from('users');
    await bucket.remove([filePath]);
    return true;
  }
}
