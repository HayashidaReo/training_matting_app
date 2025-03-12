import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/talk/model/talk_history.dart';
import 'package:matching_app/feature/talk/repo/talk_history_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'talk_history_controller.g.dart';

@riverpod
class TalkHistoryController extends _$TalkHistoryController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  /// トーク履歴を追加
  Future<void> addTalkHistory({
    required String message,
    required String imageUrl,
    required String talkRoomId,
    required String talkId,
  }) async {
    final Timestamp now = Timestamp.now();
    TalkHistory addTalkHistoryData = TalkHistory(
      talkId: talkId,
      talkerUserId: ref.read(currentUserControllerProvider)!.uid,
      message: message,
      createdAt: now,
      updatedAt: now,
      isOpened: false,
      imageUrl: imageUrl,
    );
    await ref
        .read(talkHistoryRepoProvider(talkRoomId).notifier)
        .addTalkHistory(addTalkHistoryData);
  }

  /// トーク履歴を削除(送信取り消し)
  Future<void> deleteTalkHistory({
    required TalkHistory talkHistoryData,
    required String talkRoomId,
  }) async {
    final updateTalkHistoryData = talkHistoryData.copyWith(
      message: '',
      imageUrl: '',
      updatedAt: Timestamp.now(),
    );
    await ref
        .read(talkHistoryRepoProvider(talkRoomId).notifier)
        .updateTalkHistory(updateTalkHistoryData);
  }
}

/// streamでpostに紐づくfavoritesコレクションを全て取得して監視
@riverpod
Stream<List<TalkHistory>> watchAllTalkHistoryController(
  ref,
  String talkRoomId,
) {
  return ref
      .watch(talkHistoryRepoProvider(talkRoomId).notifier)
      .watchAllTalkHistory();
}
