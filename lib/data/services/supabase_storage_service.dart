import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<String?> uploadImage({
    required File file,
    required String folder,
    required String name,
  }) async {
    try {
      final safeName = name.replaceAll(" ", "_").toLowerCase();
      final fileExt = file.path.split('.').last;
      final fileName =
          "$safeName-${DateTime.now().millisecondsSinceEpoch}.$fileExt";

      final fileBytes = await file.readAsBytes();

      await _client.storage
          .from(folder)
          .uploadBinary(
            fileName,
            fileBytes,
            fileOptions: FileOptions(
              contentType: "image/$fileExt",
              upsert: true,
            ),
          );

      return _client.storage.from(folder).getPublicUrl(fileName);
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteImage({
    required String folder,
    required String imageUrl,
  }) async {
    try {
      final fileName = imageUrl.split('/').last;
      await _client.storage.from(folder).remove([fileName]);
    } catch (_) {}
  }
}
