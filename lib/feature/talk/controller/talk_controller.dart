import 'package:cloud_firestore/cloud_firestore.dart';
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
Stream<List<Talk>> watchAllTalkRoomListController(ref) {
  return ref.watch(talkRepoProvider.notifier).watchAllTalkRoomList();
}
