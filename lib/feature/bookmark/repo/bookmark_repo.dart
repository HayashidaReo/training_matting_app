import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/bookmark/model/bookmark.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmark_repo.g.dart';

@riverpod
class BookmarkRepo extends _$BookmarkRepo {
  @override
  CollectionReference<Bookmark> build(String postId) {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebasePostDataKey.postCollection)
        .doc(postId)
        .collection(FirebaseBookmarkDataKey.bookmarkCollection)
        .withConverter<Bookmark>(
          fromFirestore: (snapshot, _) => Bookmark.fromJson(snapshot.data()!),
          toFirestore: (Bookmark value, _) => value.toJson(),
        );
  }

  /// ブックマーク追加
  Future<void> addBookmark(Bookmark addBookmarkData) async {
    await state.doc(addBookmarkData.userId).set(addBookmarkData);
  }

  /// ブックマーク解除
  Future<void> deleteBookmark(String userId) async {
    await state.doc(userId).delete();
  }

  //postに紐づくbookmarksコレクション全体を削除
  Future<void> deleteAllBookmark() async {
    final QuerySnapshot<Bookmark> snapshot = await state.get();
    for (final QueryDocumentSnapshot<Bookmark> doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  // streamでpostに紐づくbookmarksコレクションを全て取得
  Stream<List<Bookmark>> watchAllBookmarks() {
    return state.snapshots().map(
      (QuerySnapshot<Bookmark> snapshot) =>
          snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }
}

// 自分がブックマークしたbookmarksコレクションを全て取得
@riverpod
Stream<List<Bookmark>> watchMyAllBookmarks(ref) {
  return FirebaseFirestore.instance
      .collectionGroup(FirebaseBookmarkDataKey.bookmarkCollection)
      .withConverter<Bookmark>(
        fromFirestore: (snapshot, _) => Bookmark.fromJson(snapshot.data()!),
        toFirestore: (Bookmark value, _) => value.toJson(),
      )
      .where(
        FirebaseBookmarkDataKey.userId,
        isEqualTo: ref.read(currentUserControllerProvider)!.uid,
      )
      .snapshots()
      .map((QuerySnapshot<Bookmark> snapshot) {
        return snapshot.docs.map((QueryDocumentSnapshot<Bookmark> doc) {
          return doc.data();
        }).toList();
      });
}

/// streamでpostに紐づくbookmarksコレクションを全て取得して監視
@riverpod
Stream<List<Bookmark>> watchAllBookmarks(ref, String postId) {
  return ref.watch(bookmarkRepoProvider(postId).notifier).watchAllBookmarks();
}
