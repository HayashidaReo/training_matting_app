import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/utils/enum/snapshot_limit_enum.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/post/model/post.dart';
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

  Future<void> updatePost(
    Post postData,
    String body,
    File? selectedImage,
    String imageUrl,
    bool isDeleted,
  ) async {
    state = const AsyncLoading();
    String downloadUrl = '';
    if (selectedImage != null) {
      downloadUrl = await ref
          .read(storageControllerProvider.notifier)
          .uploadImageAndGetUrl(
            folderName: FirebaseStorageKey.postImageCollection,
            imageFile: selectedImage,
            docId: postData.postId,
          );
    } else if (imageUrl.isNotEmpty) {
      downloadUrl = imageUrl;
    } else if (isDeleted) {
      await ref
          .read(storageControllerProvider.notifier)
          .deleteImage(
            folderName: FirebaseStorageKey.postImageCollection,
            docId: postData.postId,
          );
    }
    Post editPostData = postData.copyWith(
      body: body,
      imageUrl: downloadUrl,
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

/// steamで全ての投稿を取得して監視
@riverpod
Stream<List<Post>> watchAllPostsController(ref) {
  final int limit = ref.watch(allPostsLimitControllerProvider);
  return ref.watch(postRepoProvider.notifier).watchAllPosts(limit);
}

@riverpod
class AllPostsLimitController extends _$AllPostsLimitController {
  @override
  int build() {
    return SnapshotLimit.allPosts.limit;
  }

  void incrementLimit() {
    state += SnapshotLimit.allPosts.limit;
  }
}

/// steamで自分の投稿を全て取得して監視
@riverpod
Stream<List<Post>> watchMyAllPostsController(ref) {
  final int limit = ref.watch(myAllPostsLimitControllerProvider);
  return ref.watch(postRepoProvider.notifier).watchMyAllPosts(limit);
}

@riverpod
class MyAllPostsLimitController extends _$MyAllPostsLimitController {
  @override
  int build() {
    return SnapshotLimit.myAllPosts.limit;
  }

  void incrementLimit() {
    state += SnapshotLimit.myAllPosts.limit;
  }
}

/// steamでpostIdからドキュメントを取得して監視
@riverpod
Stream<Post?> watchPostController(ref, String postId) {
  return ref.watch(postRepoProvider.notifier).watchPost(postId);
}
