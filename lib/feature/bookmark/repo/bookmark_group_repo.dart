import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/bookmark/model/bookmark.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmark_group_repo.g.dart';

@riverpod
class BookmarkGroupRepo extends _$BookmarkGroupRepo {
  @override
  Query<Bookmark> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collectionGroup(FirebaseBookmarkDataKey.bookmarkCollection)
        .withConverter<Bookmark>(
          fromFirestore: (snapshot, _) => Bookmark.fromJson(snapshot.data()!),
          toFirestore: (Bookmark value, _) => value.toJson(),
        );
  }

  // 自分がブックマークしたbookmarksコレクションを全て取得
  Stream<List<Bookmark>> watchMyAllBookmarks(int limit) {
    return state
        .where(
          FirebaseBookmarkDataKey.userId,
          isEqualTo: ref.read(currentUserControllerProvider)!.uid,
        )
        // ブックマークした順
        .orderBy(FirebaseBookmarkDataKey.createdAt, descending: true)
        .limit(limit)
        .snapshots()
        .map((QuerySnapshot<Bookmark> snapshot) {
          return snapshot.docs.map((QueryDocumentSnapshot<Bookmark> doc) {
            return doc.data();
          }).toList();
        });
  }
}
