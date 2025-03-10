import 'package:matching_app/feature/follow/data_model/follow.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'follow_controller.g.dart';

@riverpod
class FollowRepo extends _$FollowRepo {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  /// follow追加
  Future<void> createFollow(Follow addFollowData) async {
    await ref.read(followRepoProvider.notifier).createFollow(addFollowData);
  }

  /// follow解除
  Future<void> deleteFollow(String followId) async {
    await ref.read(followRepoProvider.notifier).deleteFollow(followId);
  }
}

@riverpod
/// 自分が対象ユーザーをフォローしているかをチェックする
Stream<bool> watchWhetherIFollowTargetUser(ref, String targetUserId) {
  return ref
      .watch(followRepoProvider.notifier)
      .watchWhetherIFollowTargetUser(targetUserId);
}

@riverpod
/// 対象ユーザーが自分をフォローしているかをチェックする
Stream<bool> watchWhetherTargetUserFollowMe(ref, String targetUserId) {
  return ref
      .watch(followRepoProvider.notifier)
      .watchWhetherTargetUserFollowMe(targetUserId);
}

@riverpod
/// 自分がfollowしているユーザーを全て取得(follow)
Stream<List<Follow>> watchAllMyFollowingUserList(ref) {
  return ref.watch(followRepoProvider.notifier).watchAllMyFollowingUserList();
}

@riverpod
/// 自分をfollowしているユーザーを全て取得(follower)
Stream<List<Follow>> watchAllFollowMeUserList(ref) {
  return ref.watch(followRepoProvider.notifier).watchAllFollowMeUserList();
}

@riverpod
/// 自分はフォローしていないが、相手から一方的にフォローされているユーザーを全て取得
Stream<List<Follow>> watchAllOnlyIncomingFollowUserList(ref) {
  return ref
      .watch(followRepoProvider.notifier)
      .watchAllOnlyIncomingFollowUserList();
}

@riverpod
/// 相互フォローしているユーザーを全て取得
Stream<List<Follow>> watchAllMutualFollowUserList(ref) {
  return ref.watch(followRepoProvider.notifier).watchAllMutualFollowUserList();
}
