import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/post/data_model/post.dart';
import 'package:matching_app/feature/post/repo/post_repo.dart';
import 'package:matching_app/feature/user/controller/storage_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'post_controller.g.dart';

@riverpod
class PostController extends _$PostController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  Future<void> addPost(String body, File? selectedImage) async {
    state = const AsyncLoading();
    String downloadUrl = '';
    String postId = const Uuid().v4();
    if (selectedImage != null) {
      downloadUrl = await ref
          .read(storageControllerProvider.notifier)
          .uploadImageAndGetUrl(
            folderName: FirebaseStorageKey.postImageCollection,
            imageFile: selectedImage,
            docId: postId,
          );
    }
    Post newPostData = Post(
      postId: postId,
      body: body,
      imageUrl: downloadUrl,
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
      userId: ref.read(currentUserControllerProvider)!.uid,
    );

    await ref.read(postRepoProvider.notifier).addPost(newPostData);
    state = const AsyncData(null);
  }

  Future<void> updatePost(Post postData, String body, String imageUrl) async {
    state = const AsyncLoading();
    Post editPostData = postData.copyWith(
      body: body,
      imageUrl: imageUrl,
      updatedAt: Timestamp.now(),
    );
    await ref.read(postRepoProvider.notifier).updatePost(editPostData);
    state = const AsyncData(null);
  }

  Future<void> deletePost(String postId) async {
    state = const AsyncLoading();
    await ref.read(postRepoProvider.notifier).deletePost(postId);
    state = const AsyncData(null);
  }
}

@riverpod
Stream<List<Post>> watchAllPostsController(ref) {
  return ref.watch(postRepoProvider.notifier).watchAllPosts();
}

@riverpod
Stream<List<Post>> watchMyAllPostsController(ref) {
  return ref.watch(postRepoProvider.notifier).watchMyAllPosts();
}

@riverpod
Stream<Post?> watchPostController(ref, String postId) {
  return ref.watch(postRepoProvider.notifier).watchPost(postId);
}

@riverpod
Stream<List<Post>> watchMyAllBookmarkPostsController(ref) {
  return ref.watch(postRepoProvider.notifier).watchMyAllBookmarkPosts();
}
