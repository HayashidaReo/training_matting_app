import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/follow/model/follow.dart';
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

  /// 自分(myUser)が対象ユーザー(targetUser)をフォローしているかをチェックする
  Stream<bool> watchWhetherIFollowTargetUser(
    String myUserId,
    String targetUserId,
  ) {
    return state
        .where(FirebaseFollowDataKey.followerUserId, isEqualTo: targetUserId)
        .where(FirebaseFollowDataKey.followingUserId, isEqualTo: myUserId)
        .snapshots()
        .map((snapshot) => snapshot.docs.isNotEmpty);
  }

  /// 対象ユーザー(targetUser)が自分(myUser)をフォローしているかをチェックする
  Future<bool> getWhetherTargetUserFollowMe(
    String myUserId,
    String targetUserId,
  ) async {
    return state
        .where(FirebaseFollowDataKey.followerUserId, isEqualTo: myUserId)
        .where(FirebaseFollowDataKey.followingUserId, isEqualTo: targetUserId)
        .get()
        .then((snapshot) => snapshot.docs.isNotEmpty);
  }

  /// 対象ユーザー(targetUser)が自分(myUser)をフォローしているかをチェックする
  Stream<bool> watchWhetherTargetUserFollowMe(
    String myUserId,
    String targetUserId,
  ) {
    return state
        .where(FirebaseFollowDataKey.followerUserId, isEqualTo: myUserId)
        .where(FirebaseFollowDataKey.followingUserId, isEqualTo: targetUserId)
        .snapshots()
        .map((snapshot) => snapshot.docs.isNotEmpty);
  }

  /// 自分(myUser)がfollowしているユーザーとのFollowを全て取得(follow)
  Stream<List<Follow>> watchAllMyFollowingUserList(String myUserId) {
    return state
        .where(FirebaseFollowDataKey.followingUserId, isEqualTo: myUserId)
        // .orderBy(FirebaseFollowDataKey.updateAt, descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  /// 自分(myUser)をfollowしているユーザーとのFollowを全て取得(follower)
  Stream<List<Follow>> watchAllFollowMeUserList(String myUserId) {
    return state
        .where(FirebaseFollowDataKey.followerUserId, isEqualTo: myUserId)
        // .orderBy(FirebaseFollowDataKey.updateAt, descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  /// 自分(myUser)はフォローしていないが、相手(targetUser)から一方的にフォローされているユーザーとのFollowを全て取得
  Stream<List<Follow>> watchAllOnlyIncomingFollowUserList(String myUserId) {
    // 自分をフォローしている全てのフォロー情報を取得
    return state
        // フォローされている人が自分
        .where(FirebaseFollowDataKey.followerUserId, isEqualTo: myUserId)
        // .orderBy(FirebaseFollowDataKey.updateAt, descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
          final follows = snapshot.docs.map((doc) => doc.data()).toList();
          final List<Follow> mutualFollows = [];

          // それぞれのフォロー関係について、自分が相手をフォローしていないか確認
          for (final follow in follows) {
            final targetUserId = follow.followingUserId;
            final reverseQuery =
                await state
                    .where(
                      // 相手の情報が一致している
                      FirebaseFollowDataKey.followerUserId,
                      isEqualTo: targetUserId,
                    )
                    .where(
                      // フォローしている人が自分でない
                      FirebaseFollowDataKey.followingUserId,
                      isEqualTo: myUserId,
                    )
                    .get();
            if (reverseQuery.docs.isEmpty) {
              mutualFollows.add(follow);
            }
          }
          return mutualFollows;
        });
  }

  /// 相互フォローしているFollowを全て取得
  Stream<List<Follow>> watchAllMutualFollowUserList(String myUserId) {
    // 自分をフォローしている全てのフォロー情報を取得
    return state
        .where(FirebaseFollowDataKey.followerUserId, isEqualTo: myUserId)
        // .orderBy(FirebaseFollowDataKey.updateAt, descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
          final follows = snapshot.docs.map((doc) => doc.data()).toList();
          final List<Follow> mutualFollows = [];

          // それぞれのフォロー関係について、自分が相手をフォローしているか確認
          for (final follow in follows) {
            final targetUserId = follow.followingUserId;
            final reverseQuery =
                await state
                    .where(
                      FirebaseFollowDataKey.followerUserId,
                      isEqualTo: targetUserId,
                    )
                    .where(
                      FirebaseFollowDataKey.followingUserId,
                      isEqualTo: myUserId,
                    )
                    .get();
            if (reverseQuery.docs.isNotEmpty) {
              mutualFollows.add(follow);
            }
          }
          return mutualFollows;
        });
  }
}
