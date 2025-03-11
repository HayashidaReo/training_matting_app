import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/bookmark/controller/bookmark_controller.dart';
import 'package:matching_app/feature/favorite/controller/favorite_controller.dart';
import 'package:matching_app/feature/post/model/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_repo.g.dart';

@riverpod
class PostRepo extends _$PostRepo {
  @override
  CollectionReference<Post> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebasePostDataKey.postCollection)
        .withConverter<Post>(
          fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
          toFirestore: (Post value, _) => value.toJson(),
        );
  }

  /// steamで全ての投稿を取得
  Stream<List<Post>> watchAllPosts() {
    return state
        .orderBy(FirebasePostDataKey.createdAt, descending: true)
        .snapshots()
        .map((QuerySnapshot<Post> snapshot) {
          return snapshot.docs.map((QueryDocumentSnapshot<Post> doc) {
            return doc.data();
          }).toList();
        });
  }

  /// streamで自分の投稿を全て取得
  Stream<List<Post>> watchMyAllPosts() {
    return state
        .orderBy(FirebasePostDataKey.createdAt, descending: true)
        .where(
          FirebasePostDataKey.userId,
          isEqualTo: ref.read(currentUserControllerProvider)!.uid,
        )
        .snapshots()
        .map((QuerySnapshot<Post> snapshot) {
          return snapshot.docs.map((QueryDocumentSnapshot<Post> doc) {
            return doc.data();
          }).toList();
        });
  }

  /// streamでtaskIdからドキュメントを取得
  Stream<Post> watchPost(String postId) {
    return state.doc(postId).snapshots().map((DocumentSnapshot<Post> snapshot) {
      return snapshot.data()!;
    });
  }

  /// postを投稿(追加)
  Future<void> addPost(Post addPostData) async {
    await state.doc(addPostData.postId).set(addPostData);
  }

  /// postを削除(削除)
  Future<void> deletePost(String deletePostId) async {
    // いいねを削除
    ref
        .watch(favoriteControllerProvider.notifier)
        .deleteAllFavorite(deletePostId);
    // ブックマークを削除
    ref
        .watch(bookmarkControllerProvider.notifier)
        .deleteAllBookmark(deletePostId);
    // 最後にドキュメントを削除
    await state.doc(deletePostId).delete();
  }

  // postを編集して更新
  Future<void> updatePost(Post updatePostData) async {
    await state.doc(updatePostData.postId).update(updatePostData.toJson());
  }
}
