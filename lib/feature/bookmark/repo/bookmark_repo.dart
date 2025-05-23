import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
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
    await state.doc(addBookmarkData.bookmarkId).set(addBookmarkData);
  }

  /// ブックマーク解除
  Future<void> deleteBookmark(String bookmarkId) async {
    await state.doc(bookmarkId).delete();
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
