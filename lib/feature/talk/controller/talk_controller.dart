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
  Future<void> createTalkRoom(String myUserId, String targetUserid) async {
    state = const AsyncLoading();
    final Timestamp now = Timestamp.now();
    Talk addTalkData = Talk(
      talkRoomId: '${myUserId}_$targetUserid',
      userIds: [myUserId, targetUserid],
      talkHistory: {},
      createdAt: now,
      updatedAt: now,
    );

    await ref.read(talkRepoProvider.notifier).createTalkRoom(addTalkData);
    state = const AsyncData(null);
  }
}
