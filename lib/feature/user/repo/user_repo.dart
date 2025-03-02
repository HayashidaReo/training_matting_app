import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_training/config/firebase/firebase_instance_provider.dart';
import 'package:riverpod_training/config/utils/keys/firebase_key.dart';
import 'package:riverpod_training/features/user/data_model/account.dart';

part 'user_repo.g.dart';

@riverpod
class UserRepo extends _$UserRepo {
  @override
  CollectionReference<User> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebaseUserKey.userCollection)
        .withConverter<Account>(
          fromFirestore: (snapshot, _) => Account.fromJson(snapshot.data()!),
          toFirestore: (Account value, _) => value.toJson(),
        );
  }

  // ドキュメント追加
  Future<void> createUser(Account addUserData) async {
    await state.doc(addUserData.userId).set(addUserData);
  }

  // ドキュメント更新
  Future<void> updateUser(Account updateUserData) async {
    await state.doc(updateUserData.userId).update(updateUserData.toJson());
  }

  // ドキュメント削除
  Future<void> deleteUser(String deleteUserId) async {
    await state.doc(deleteUserId).delete();
  }

  // 1件ドキュメント取得
  Future<Account?> getUser(String userId) async {
    final snapshot = await state.doc(userId).get();
    return snapshot.data();
  }

  // streamでuserドキュメント取得
  Stream<Account?> watchUser(String userId) {
    return state
        .doc(userId)
        .snapshots()
        .map((DocumentSnapshot<Account> snapshot) => snapshot.data());
  }

  // コレクション全体を取得
  Future<List<Account>> getUsers() async {
    final snapshot = await state.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  // streamでuserListを取得
  Stream<List<Account>> watchUsers() {
    return state
        .orderBy(FirebaseUserKey.createdAt, descending: true)
        .snapshots()
        .map((QuerySnapshot<Account> snapshot) {
          return snapshot.docs.map((QueryDocumentSnapshot<Account> doc) {
            return doc.data();
          }).toList();
        });
  }
}

// @riverpod
// Stream<Account?> watchAccount(ref, String userId) {
//   return ref.watch(userRepoProvider.notifier).watchUser(userId);
// }

// // 自分のユーザー情報を監視
// @riverpod
// Stream<Account?> watchMyAccount(ref) {
//   return ref
//       .watch(userRepoProvider.notifier)
//       .watchUser(ref.read(authRepoProvider)!.uid);
// }

// @riverpod
// // streamでuserListを取得
// Stream<List<Account>> watchUsers(ref) {
//   return ref.watch(userRepoProvider.notifier).watchUsers();
// }
