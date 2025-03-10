import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/favorite/model/favorite.dart';
import 'package:matching_app/feature/favorite/repo/favorite_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_controller.g.dart';

@riverpod
class FavoriteController extends _$FavoriteController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  /// いいね追加
  Future<void> addFavorite(Favorite addFavoriteData) async {
    state = const AsyncLoading();
    await ref
        .read(favoriteRepoProvider(addFavoriteData.postId).notifier)
        .addFavorite(addFavoriteData);
    state = const AsyncData(null);
  }

  /// いいね解除
  Future<void> deleteFavorite(String userId) async {
    state = const AsyncLoading();
    await ref
        .read(favoriteRepoProvider(userId).notifier)
        .deleteFavorite(userId);
    state = const AsyncData(null);
  }

  /// postに紐づくfavoriteコレクション全体を削除
  Future<void> deleteAllFavorite() async {
    state = const AsyncLoading();
    await ref.read(favoriteRepoProvider('').notifier).deleteAllFavorite();
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
