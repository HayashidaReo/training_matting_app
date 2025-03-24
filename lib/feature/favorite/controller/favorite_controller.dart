import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/favorite/model/favorite.dart';
import 'package:matching_app/feature/favorite/repo/favorite_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'favorite_controller.g.dart';

@riverpod
class FavoriteController extends _$FavoriteController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  /// いいね追加
  Future<void> addFavorite(String postId) async {
    state = const AsyncLoading();
    final Timestamp now = Timestamp.now();
    String favoriteId = const Uuid().v4();
    final Favorite addFavoriteData = Favorite(
      favoriteId: favoriteId,
      userId: ref.read(currentUserControllerProvider)!.uid,
      postId: postId,
      createdAt: now,
      updatedAt: now,
    );
    await ref
        .read(favoriteRepoProvider(addFavoriteData.postId).notifier)
        .addFavorite(addFavoriteData);
    state = const AsyncData(null);
  }

  /// いいね解除
  Future<void> deleteFavorite(String postId, String favoriteId) async {
    state = const AsyncLoading();
    await ref
        .read(favoriteRepoProvider(postId).notifier)
        .deleteFavorite(favoriteId);
    state = const AsyncData(null);
  }

  /// postに紐づくfavoriteコレクション全体を削除
  Future<void> deleteAllFavorite(String postId) async {
    state = const AsyncLoading();
    await ref.read(favoriteRepoProvider(postId).notifier).deleteAllFavorite();
    state = const AsyncData(null);
  }

  /// streamでpostに紐づくfavoritesコレクションを全て取得
  Stream<List<Favorite>> watchAllFavorites(String postId) {
    return ref.read(favoriteRepoProvider(postId).notifier).watchAllFavorites();
  }
}

/// 自分がいいねしたfavoritesコレクションを全て取得して監視
@riverpod
Stream<List<Favorite>> watchMyAllFavoritesController(ref) {
  return FirebaseFirestore.instance
      .collectionGroup(FirebaseFavoriteDataKey.favoriteCollection)
      .withConverter<Favorite>(
        fromFirestore: (snapshot, _) => Favorite.fromJson(snapshot.data()!),
        toFirestore: (Favorite value, _) => value.toJson(),
      )
      .where(
        FirebaseFavoriteDataKey.userId,
        isEqualTo: ref.read(currentUserControllerProvider)!.uid,
      )
      .orderBy(FirebaseFavoriteDataKey.createdAt, descending: true)
      .snapshots()
      .map((QuerySnapshot<Favorite> snapshot) {
        return snapshot.docs.map((QueryDocumentSnapshot<Favorite> doc) {
          return doc.data();
        }).toList();
      });
}

/// streamでpostに紐づくfavoritesコレクションを全て取得して監視
@riverpod
Stream<List<Favorite>> watchAllFavoritesController(ref, String postId) {
  return ref.watch(favoriteRepoProvider(postId).notifier).watchAllFavorites();
}
