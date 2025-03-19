import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/utils/enum/snapshot_limit_enum.dart';
import 'package:matching_app/feature/talk/model/talk.dart';
import 'package:matching_app/feature/talk/repo/talk_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'talk_controller.g.dart';

@riverpod
class TalkController extends _$TalkController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  /// トークルームを作成
  Future<void> createTalkRoom(String myUserId, String targetUserId) async {
    state = const AsyncLoading();
    final Timestamp now = Timestamp.now();
    final List<String> userIds = [myUserId, targetUserId];
    userIds.sort();
    final talkRoomId = '${userIds[0]}_${userIds[1]}';

    Talk addTalkData = Talk(
      talkRoomId: talkRoomId,
      userIds: userIds,
      createdAt: now,
      updatedAt: now,
    );

    await ref.read(talkRepoProvider.notifier).createTalkRoom(addTalkData);
    state = const AsyncData(null);
  }

  /// TalkRoomを削除
  Future<void> deleteTalkRoom(String myUserId, String targetUserId) async {
    final List<String> userIds = [myUserId, targetUserId];
    userIds.sort(); // アルファベット順にソート
    final talkRoomId = '${userIds[0]}_${userIds[1]}';
    ref.read(talkRepoProvider.notifier).deleteTalkRoom(talkRoomId);
  }

  /// TalkRoomのupdateAtを更新
  Future<void> updateUpdateAtOfTalkRoom(String talkRoomId) async {
    await ref
        .read(talkRepoProvider.notifier)
        .updateUpdateAtOfTalkRoom(talkRoomId);
  }
}

@riverpod
/// トークルーム一覧を取得
Stream<List<Talk>> watchAllTalkRoomListController(ref) {
  final int limit = ref.watch(allTalkRoomListLimitControllerProvider);
  return ref.watch(talkRepoProvider.notifier).watchAllTalkRoomList(limit);
}

@riverpod
class AllTalkRoomListLimitController extends _$AllTalkRoomListLimitController {
  @override
  int build() {
    return SnapshotLimit.allTalkRoom.limit;
  }

  void incrementLimit() {
    state += SnapshotLimit.allTalkRoom.limit;
  }
}

@riverpod
/// 指定したトークルームの部屋があるかどうかを監視する
Stream<bool> watchExistTalkRoomController(ref, String talkRoomId) {
  return ref.watch(talkRepoProvider.notifier).watchExistTalkRoom(talkRoomId);
}
