import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/user/model/userdata.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repo.g.dart';

@riverpod
class UserRepo extends _$UserRepo {
  @override
  CollectionReference<UserData> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebaseUserDataKey.userCollection)
        .withConverter<UserData>(
          fromFirestore: (snapshot, _) => UserData.fromJson(snapshot.data()!),
          toFirestore: (UserData value, _) => value.toJson(),
        );
  }

  // ドキュメント追加
  Future<void> createUser(UserData addUserData) async {
    await state.doc(addUserData.userId).set(addUserData);
  }

  // ドキュメント更新
  Future<void> updateUser(UserData updateUserData) async {
    await state.doc(updateUserData.userId).update(updateUserData.toJson());
  }

  // ドキュメント削除
  Future<void> deleteUser(String deleteUserId) async {
    await state.doc(deleteUserId).delete();
  }

  // 1件ドキュメント取得
  Future<UserData?> getUser(String userId) async {
    final snapshot = await state.doc(userId).get();
    return snapshot.data();
  }

  // streamでuserドキュメント取得
  Stream<UserData?> watchUser(String userId) {
    return state
        .doc(userId)
        .snapshots()
        .map((DocumentSnapshot<UserData> snapshot) => snapshot.data());
  }

  // コレクション全体を取得
  Future<List<UserData>> getUsers() async {
    final snapshot = await state.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  // streamでuserListを取得
  Stream<List<UserData>> watchAllUsers(int limit) {
    return state
        .orderBy(FirebaseUserDataKey.createdAt, descending: true)
        .limit(limit)
        .snapshots()
        .map((QuerySnapshot<UserData> snapshot) {
          return snapshot.docs.map((QueryDocumentSnapshot<UserData> doc) {
            return doc.data();
          }).toList();
        });
  }

  // streamで性別を指定してuserListを取得
  Stream<List<UserData>> watchOppositeGenderUsers(int myGender, int limit) {
    return state
        .where(FirebaseUserDataKey.gender, isNotEqualTo: myGender)
        .orderBy(FirebaseUserDataKey.createdAt, descending: true)
        .limit(limit)
        .snapshots()
        .map((QuerySnapshot<UserData> snapshot) {
          return snapshot.docs.map((QueryDocumentSnapshot<UserData> doc) {
            return doc.data();
          }).toList();
        });
  }

  // streamで指定した文字列と前方一致のuserのuserListを取得
  Stream<List<UserData>> watchForwardMatchingWithQueryTextUsers(
    String queryText,
    int limit,
  ) {
    return state
        .orderBy(FirebaseUserDataKey.createdAt, descending: true)
        .where(FirebaseUserDataKey.userName, isGreaterThanOrEqualTo: queryText)
        .where(FirebaseUserDataKey.userName, isLessThan: '$queryText\uf8ff')
        .limit(limit)
        .snapshots()
        .map((QuerySnapshot<UserData> snapshot) {
          return snapshot.docs.map((QueryDocumentSnapshot<UserData> doc) {
            return doc.data();
          }).toList();
        });
  }

  // streamで指定した性別で指定した文字列と前方一致のuserのuserListを取得
  Stream<List<UserData>> watchForwardMatchingWithQueryTextAndGenderUsers(
    String queryText,
    int myGender,
    int limit,
  ) {
    return state
        .orderBy(FirebaseUserDataKey.createdAt, descending: true)
        .where(FirebaseUserDataKey.userName, isGreaterThanOrEqualTo: queryText)
        .where(FirebaseUserDataKey.gender, isNotEqualTo: myGender)
        .where(FirebaseUserDataKey.userName, isLessThan: '$queryText\uf8ff')
        .limit(limit)
        .snapshots()
        .map((QuerySnapshot<UserData> snapshot) {
          return snapshot.docs.map((QueryDocumentSnapshot<UserData> doc) {
            return doc.data();
          }).toList();
        });
  }
}
