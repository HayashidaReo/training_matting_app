import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/utils/enum/snapshot_limit_enum.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/follow/model/follow.dart';
import 'package:matching_app/feature/follow/repo/follow_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  /// 自分が対象ユーザーをフォローしているかをチェックする
  Future<bool> getWhetherTargetUserFollowMe(
    String myUserId,
    String targetUserId,
  ) {
    return ref
        .read(followRepoProvider.notifier)
        .getWhetherTargetUserFollowMe(myUserId, targetUserId);
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
/// 自分がfollowしているユーザーを数制限ありで取得(follow)
Stream<List<Follow>> watchAllMyFollowingUserListLimitedController(
  ref,
  String myUserId,
) {
  final int limit = ref.watch(allMyFollowingUserLimitControllerProvider);
  return ref
      .watch(followRepoProvider.notifier)
      .watchAllMyFollowingUserListLimited(myUserId, limit);
}

@riverpod
class AllMyFollowingUserLimitController
    extends _$AllMyFollowingUserLimitController {
  @override
  int build() {
    return SnapshotLimit.allMyFollowingUser.limit;
  }

  void incrementLimit() {
    state += SnapshotLimit.allMyFollowingUser.limit;
  }
}

@riverpod
/// 自分をfollowしているユーザーを全て取得(follower)
Stream<List<Follow>> watchAllFollowMeUserListController(ref, String myUserId) {
  return ref
      .watch(followRepoProvider.notifier)
      .watchAllFollowMeUserList(myUserId);
}

@riverpod
/// 自分をfollowしているユーザーを数制限ありで取得(follower)
Stream<List<Follow>> watchAllFollowMeUserListLimitedController(
  ref,
  String myUserId,
) {
  final int limit = ref.watch(allFollowMeUserLimitControllerProvider);
  return ref
      .watch(followRepoProvider.notifier)
      .watchAllFollowMeUserListLimited(myUserId, limit);
}

@riverpod
class AllFollowMeUserLimitController extends _$AllFollowMeUserLimitController {
  @override
  int build() {
    return SnapshotLimit.allFollowMeUser.limit;
  }

  void incrementLimit() {
    state += SnapshotLimit.allFollowMeUser.limit;
  }
}

@riverpod
/// 自分はフォローしていないが、相手から一方的にフォローされているユーザーを全て取得
Stream<List<Follow>> watchAllOnlyIncomingFollowUserListController(
  ref,
  String myUserId,
) {
  final int limit = ref.watch(allOnlyIncomingFollowUserLimitControllerProvider);
  return ref
      .watch(followRepoProvider.notifier)
      .watchAllOnlyIncomingFollowUserList(myUserId, limit);
}

@riverpod
class AllOnlyIncomingFollowUserLimitController
    extends _$AllOnlyIncomingFollowUserLimitController {
  @override
  int build() {
    return SnapshotLimit.allOnlyIncomingFollowUser.limit;
  }

  void incrementLimit() {
    state += SnapshotLimit.allOnlyIncomingFollowUser.limit;
  }
}

@riverpod
/// 相互フォローしているユーザーを全て取得
Stream<List<Follow>> watchAllMutualFollowUserListController(
  ref,
  String myUserId,
) {
  final int limit = ref.watch(allMutualFollowUserLimitControllerProvider);
  return ref
      .watch(followRepoProvider.notifier)
      .watchAllMutualFollowUserList(myUserId, limit);
}

@riverpod
class AllMutualFollowUserLimitController
    extends _$AllMutualFollowUserLimitController {
  @override
  int build() {
    return SnapshotLimit.allMutualFollowUser.limit;
  }

  void incrementLimit() {
    state += SnapshotLimit.allMutualFollowUser.limit;
  }
}
