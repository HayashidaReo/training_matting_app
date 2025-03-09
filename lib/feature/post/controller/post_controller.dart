import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/post/data_model/post.dart';
import 'package:matching_app/feature/post/repo/post_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'post_controller.g.dart';

@riverpod
class PostController extends _$PostController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  Future<void> addPost(String body, String imageUrl) async {
    state = const AsyncLoading();
    Post newPostData = Post(
      postId: const Uuid().v4(),
      body: body,
      imageUrl: imageUrl,
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
      userId: ref.read(currentUserControllerProvider)!.uid,
    );

    await ref.read(postRepoProvider.notifier).addPost(newPostData);
    state = const AsyncData(null);
  }

  // Future<void> updatePost(Post postData, String body) async {
  //   state = const AsyncLoading();
  //   Post editPostData = postData.copyWith(body: body);
  //   await ref.read(postRepoProvider.notifier).updatePost(editPostData);
  //   state = const AsyncData(null);
  // }

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
