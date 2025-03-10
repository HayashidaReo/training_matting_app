import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/follow/data_model/follow.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'follow_repo.g.dart';

@riverpod
class FollowRepo extends _$FollowRepo {
  @override
  CollectionReference<Follow> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebaseFollowDataKey.followCollection)
        .withConverter<Follow>(
          fromFirestore: (snapshot, _) => Follow.fromJson(snapshot.data()!),
          toFirestore: (Follow value, _) => value.toJson(),
        );
  }

  /// follow追加
  Future<void> createFollow(Follow addFollowData) async {
    await state.doc(addFollowData.followId).set(addFollowData);
  }

  /// follow解除
  Future<void> deleteFollow(String followId) async {
    await state.doc(followId).delete();
  }

  /// 自分が対象ユーザーをフォローしているかをチェックする
  Stream<bool> watchWhetherIFollowTargetUser(String targetUserId) {
    return state
        .where(FirebaseFollowDataKey.followerUserId, isEqualTo: targetUserId)
        .where(
          FirebaseFollowDataKey.followingUserId,
          isEqualTo: ref.read(currentUserControllerProvider)!.uid,
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.isNotEmpty);
  }

  /// 対象ユーザーが自分をフォローしているかをチェックする
  Stream<bool> watchWhetherTargetUserFollowMe(String targetUserId) {
    return state
        .where(
          FirebaseFollowDataKey.followerUserId,
          isEqualTo: ref.read(currentUserControllerProvider)!.uid,
        )
        .where(FirebaseFollowDataKey.followingUserId, isEqualTo: targetUserId)
        .snapshots()
        .map((snapshot) => snapshot.docs.isNotEmpty);
  }

  /// 自分がfollowしているユーザーを全て取得(follow)
  Stream<List<Follow>> watchAllMyFollowingUserList() {
    return state
        .where(
          FirebaseFollowDataKey.followingUserId,
          isEqualTo: ref.read(currentUserControllerProvider)!.uid,
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  /// 自分をfollowしているユーザーを全て取得(follower)
  Stream<List<Follow>> watchAllFollowMeUserList() {
    return state
        .where(
          FirebaseFollowDataKey.followerUserId,
          isEqualTo: ref.read(currentUserControllerProvider)!.uid,
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  /// 自分はフォローしていないが、相手から一方的にフォローされているユーザーを全て取得
  Stream<List<Follow>> watchAllOnlyIncomingFollowUserList() {
    return state
        .where(
          FirebaseFollowDataKey.followingUserId,
          isNotEqualTo: ref.read(currentUserControllerProvider)!.uid,
        )
        .where(
          FirebaseFollowDataKey.followerUserId,
          isEqualTo: ref.read(currentUserControllerProvider)!.uid,
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  /// 相互フォローしているユーザーを全て取得
  Stream<List<Follow>> watchAllMutualFollowUserList() {
    return state
        .where(
          FirebaseFollowDataKey.followingUserId,
          isEqualTo: ref.read(currentUserControllerProvider)!.uid,
        )
        .where(
          FirebaseFollowDataKey.followerUserId,
          isEqualTo: ref.read(currentUserControllerProvider)!.uid,
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}
