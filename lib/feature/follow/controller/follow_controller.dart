import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/follow/data_model/follow.dart';
import 'package:matching_app/feature/follow/repo/follow_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'follow_controller.g.dart';

@riverpod
class FollowController extends _$FollowController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  /// follow追加
  Future<void> createFollow(String targetUserId) async {
    final String myUid = ref.read(currentUserControllerProvider)!.uid;
    if (myUid == targetUserId) {
      return;
    }
    final Timestamp now = Timestamp.now();
    Follow addFollowData = Follow(
      followId: '${myUid}_$targetUserId',
      followerUserId: targetUserId,
      followingUserId: myUid,
      createdAt: now,
      updatedAt: now,
    );
    await ref.read(followRepoProvider.notifier).createFollow(addFollowData);
  }

  /// follow解除
  Future<void> deleteFollow(String targetUserId) async {
    final String myUid = ref.read(currentUserControllerProvider)!.uid;
    final String followId = '${myUid}_$targetUserId';
    await ref.read(followRepoProvider.notifier).deleteFollow(followId);
  }
}

@riverpod
/// 自分が対象ユーザーをフォローしているかをチェックする
Stream<bool> watchWhetherIFollowTargetUserController(
  ref,
  String myUserId,
  String targetUserId,
) {
  return ref
      .watch(followRepoProvider.notifier)
      .watchWhetherIFollowTargetUser(myUserId, targetUserId);
}

@riverpod
/// 対象ユーザーが自分をフォローしているかをチェックする
Stream<bool> watchWhetherTargetUserFollowMeController(
  ref,
  String myUserId,
  String targetUserId,
) {
  return ref
      .watch(followRepoProvider.notifier)
      .watchWhetherTargetUserFollowMe(myUserId, targetUserId);
}

@riverpod
/// 自分がfollowしているユーザーを全て取得(follow)
Stream<List<Follow>> watchAllMyFollowingUserListController(
  ref,
  String myUserId,
) {
  return ref
      .watch(followRepoProvider.notifier)
      .watchAllMyFollowingUserList(myUserId);
}

@riverpod
/// 自分をfollowしているユーザーを全て取得(follower)
Stream<List<Follow>> watchAllFollowMeUserListController(ref, String myUserId) {
  return ref
      .watch(followRepoProvider.notifier)
      .watchAllFollowMeUserList(myUserId);
}

@riverpod
/// 自分はフォローしていないが、相手から一方的にフォローされているユーザーを全て取得
Stream<List<Follow>> watchAllOnlyIncomingFollowUserListController(
  ref,
  String myUserId,
) {
  return ref
      .watch(followRepoProvider.notifier)
      .watchAllOnlyIncomingFollowUserList(myUserId);
}

@riverpod
/// 相互フォローしているユーザーを全て取得
Stream<List<Follow>> watchAllMutualFollowUserListController(
  ref,
  String myUserId,
) {
  return ref
      .watch(followRepoProvider.notifier)
      .watchAllMutualFollowUserList(myUserId);
}
