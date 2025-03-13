import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/bookmark/model/bookmark.dart';
import 'package:matching_app/feature/bookmark/repo/bookmark_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmark_controller.g.dart';

@riverpod
class BookmarkController extends _$BookmarkController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  /// ブックマーク追加
  Future<void> addBookmark(String postId) async {
    state = const AsyncLoading();
    final Timestamp now = Timestamp.now();
    final Bookmark addBookmarkData = Bookmark(
      userId: ref.read(currentUserControllerProvider)!.uid,
      postId: postId,
      createdAt: now,
      updatedAt: now,
    );
    await ref
        .read(bookmarkRepoProvider(addBookmarkData.postId).notifier)
        .addBookmark(addBookmarkData);
    state = const AsyncData(null);
  }

  /// ブックマーク解除
  Future<void> deleteBookmark(String postId, String userId) async {
    state = const AsyncLoading();
    await ref
        .read(bookmarkRepoProvider(postId).notifier)
        .deleteBookmark(userId);
    state = const AsyncData(null);
  }

  //postに紐づくbookmarksコレクション全体を削除
  Future<void> deleteAllBookmark(String postId) async {
    state = const AsyncLoading();
    await ref.read(bookmarkRepoProvider(postId).notifier).deleteAllBookmark();
    state = const AsyncData(null);
  }

  // streamでpostに紐づくbookmarksコレクションを全て取得
  Stream<List<Bookmark>> watchAllBookmarks(String postId) {
    return ref.read(bookmarkRepoProvider(postId).notifier).watchAllBookmarks();
  }
}

// 自分がブックマークしたbookmarksコレクションを全て取得
@riverpod
Stream<List<Bookmark>> watchMyAllBookmarksController(ref) {
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
      .orderBy(FirebaseBookmarkDataKey.createdAt, descending: true)
      .snapshots()
      .map((QuerySnapshot<Bookmark> snapshot) {
        return snapshot.docs.map((QueryDocumentSnapshot<Bookmark> doc) {
          return doc.data();
        }).toList();
      });
}

/// streamでpostに紐づくbookmarksコレクションを全て取得して監視
@riverpod
Stream<List<Bookmark>> watchAllBookmarksController(ref, String postId) {
  return ref.watch(bookmarkRepoProvider(postId).notifier).watchAllBookmarks();
}
