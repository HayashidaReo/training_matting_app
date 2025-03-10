import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_repo.g.dart';

@riverpod
class StorageRepo extends _$StorageRepo {
  @override
  FirebaseStorage build() {
    return ref.read(firebaseStorageInstanceProvider);
  }

  // 画像アップロード
  Future<String> uploadImageAndGetUrl({
    required File imageFile,
    required String folderName,
    required String docId,
  }) async {
    final storageRef = await state
        .ref()
        .child('$folderName/$docId')
        .putFile(imageFile);
    final downloadUrl = await storageRef.ref.getDownloadURL();
    return downloadUrl;
  }

  // 画像削除
  Future<void> deleteImage({required String userId}) async {
    try {
      await state.ref('users/$userId').delete();
    } catch (e) {
      return;
    }
  }
}
