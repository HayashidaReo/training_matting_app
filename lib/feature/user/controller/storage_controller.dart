import 'dart:io';
import 'dart:typed_data';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/user/repo/storage_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_controller.g.dart';

@riverpod
class StorageController extends _$StorageController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  Future<String> uploadImageAndGetUrl({
    required String folderName,
    required File imageFile,
    required String docId,
  }) async {
    state = const AsyncLoading();
    final String imageUrl = await ref
        .read(storageRepoProvider.notifier)
        .uploadImageAndGetUrl(
          imageFile: imageFile,
          folderName: folderName,
          docId: docId,
        );
    state = const AsyncData(null);
    return imageUrl;
  }

  Future<void> deleteImage() async {
    state = const AsyncLoading();
    await ref
        .read(storageRepoProvider.notifier)
        .deleteImage(userId: ref.read(currentUserControllerProvider)!.uid);
    state = const AsyncData(null);
  }
}
