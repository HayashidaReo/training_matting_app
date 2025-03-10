import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/favorite/model/favorite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_repo.g.dart';

@riverpod
class FavoriteRepo extends _$FavoriteRepo {
  @override
  CollectionReference<Favorite> build(String postId) {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebasePostDataKey.postCollection)
        .doc(postId)
        .collection(FirebaseFavoriteDataKey.favoriteCollection)
        .withConverter<Favorite>(
          fromFirestore: (snapshot, _) => Favorite.fromJson(snapshot.data()!),
          toFirestore: (Favorite value, _) => value.toJson(),
        );
  }

  /// いいね追加
  Future<void> addFavorite(Favorite addFavoriteData) async {
    await state.doc(addFavoriteData.userId).set(addFavoriteData);
  }

  /// いいね解除
  Future<void> deleteFavorite(String userId) async {
    await state.doc(userId).delete();
  }

  /// postに紐づくfavoriteコレクション全体を削除
  Future<void> deleteAllFavorite() async {
    final QuerySnapshot<Favorite> snapshot = await state.get();
    for (final QueryDocumentSnapshot<Favorite> doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  /// streamでpostに紐づくfavoritesコレクションを全て取得
  Stream<List<Favorite>> watchAllFavorites() {
    return state.snapshots().map(
      (QuerySnapshot<Favorite> snapshot) =>
          snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }
}
