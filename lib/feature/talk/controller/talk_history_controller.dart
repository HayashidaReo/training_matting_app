import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/talk/controller/talk_controller.dart';
import 'package:matching_app/feature/talk/model/talk_history.dart';
import 'package:matching_app/feature/talk/repo/talk_history_repo.dart';
import 'package:matching_app/feature/user/controller/storage_controller.dart';
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
    required String targetUserId,
  }) async {
    final Timestamp now = Timestamp.now();
    TalkHistory addTalkHistoryData = TalkHistory(
      talkId: talkId,
      talkRoomId: talkRoomId,
      talkerUserId: ref.read(currentUserControllerProvider)!.uid,
      userIds: [ref.read(currentUserControllerProvider)!.uid, targetUserId],
      message: message,
      createdAt: now,
      updatedAt: now,
      isOpened: false,
      imageUrl: imageUrl,
    );
    await ref
        .read(talkHistoryRepoProvider(talkRoomId).notifier)
        .addTalkHistory(addTalkHistoryData);
    await ref
        .read(talkControllerProvider.notifier)
        .updateUpdateAtOfTalkRoom(talkRoomId);
  }

  /// 既読をつける
  Future<void> openTalkHistory({required TalkHistory talkHistoryData}) async {
    final updateTalkHistoryData = talkHistoryData.copyWith(
      isOpened: true,
      updatedAt: Timestamp.now(),
    );
    await ref
        .read(
          talkHistoryRepoProvider(updateTalkHistoryData.talkRoomId).notifier,
        )
        .updateTalkHistory(updateTalkHistoryData);
  }

  /// トーク履歴を削除(送信取り消し)
  Future<void> deleteTalkHistory({required TalkHistory talkHistoryData}) async {
    final updateTalkHistoryData = talkHistoryData.copyWith(
      message: '',
      imageUrl: '',
      updatedAt: Timestamp.now(),
    );
    // 画像の削除
    if (talkHistoryData.imageUrl.isNotEmpty) {
      await ref
          .read(storageControllerProvider.notifier)
          .deleteImage(
            folderName:
                '${FirebaseStorageKey.talkImageCollection}/${updateTalkHistoryData.talkRoomId}',
            docId: talkHistoryData.talkId,
          );
    }
    await ref
        .read(
          talkHistoryRepoProvider(updateTalkHistoryData.talkRoomId).notifier,
        )
        .updateTalkHistory(updateTalkHistoryData);
  }

  /// talkRoomIdに紐づくtalk_historyコレクション全体を削除
  Future<void> deleteAllTalkHistory({required String talkRoomId}) async {
    ref
        .read(talkHistoryRepoProvider(talkRoomId).notifier)
        .deleteAllTalkHistory();
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

/// streamでtalkRoomIdに紐づく最新のtalk_historyコレクションを１件取得
@riverpod
Stream<TalkHistory?> watchLatestTalkHistoryController(ref, String talkRoomId) {
  return ref
      .watch(talkHistoryRepoProvider(talkRoomId).notifier)
      .watchLatestTalkHistory();
}

@riverpod
/// streamでtalkRoomIdに紐づく最新のtalk_historyコレクションを１件取得
Stream<int> watchNotOpenedTalkHistoryCountController(ref, String talkRoomId) {
  return ref
      .watch(talkHistoryRepoProvider(talkRoomId).notifier)
      .watchNotOpenedTalkHistoryCount();
}
