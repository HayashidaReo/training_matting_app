import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/utils/enum/snapshot_limit_enum.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/bookmark/model/bookmark.dart';
import 'package:matching_app/feature/bookmark/repo/bookmark_group_repo.dart';
import 'package:matching_app/feature/bookmark/repo/bookmark_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

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
    String bookmarkId = const Uuid().v4();
    final Bookmark addBookmarkData = Bookmark(
      bookmarkId: bookmarkId,
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
  Future<void> deleteBookmark(String postId, String bookmarkId) async {
    state = const AsyncLoading();
    await ref
        .read(bookmarkRepoProvider(postId).notifier)
        .deleteBookmark(bookmarkId);
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
  final int limit = ref.watch(myAllBookmarksLimitControllerProvider);
  return ref
      .read(bookmarkGroupRepoProvider.notifier)
      .watchMyAllBookmarks(limit);
}

@riverpod
class MyAllBookmarksLimitController extends _$MyAllBookmarksLimitController {
  @override
  int build() {
    return SnapshotLimit.myAllBookmarks.limit;
  }

  void incrementLimit() {
    state += SnapshotLimit.myAllBookmarks.limit;
  }
}

/// streamでpostに紐づくbookmarksコレクションを全て取得して監視
@riverpod
Stream<List<Bookmark>> watchAllBookmarksController(ref, String postId) {
  return ref.watch(bookmarkRepoProvider(postId).notifier).watchAllBookmarks();
}
