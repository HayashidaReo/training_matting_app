import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/talk/model/talk_history.dart';
import 'package:matching_app/feature/user/controller/storage_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'talk_history_repo.g.dart';

@riverpod
class TalkHistoryRepo extends _$TalkHistoryRepo {
  @override
  CollectionReference<TalkHistory> build(String talkRoomId) {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebaseTalkDataKey.talkCollection)
        .doc(talkRoomId)
        .collection(FirebaseTalkHistoryDataKey.talkHistoryCollection)
        .withConverter<TalkHistory>(
          fromFirestore:
              (snapshot, _) => TalkHistory.fromJson(snapshot.data()!),
          toFirestore: (TalkHistory value, _) => value.toJson(),
        );
  }

  /// トーク履歴を追加
  Future<void> addTalkHistory(TalkHistory addTalkHistoryData) async {
    await state.doc(addTalkHistoryData.talkId).set(addTalkHistoryData);
  }

  /// トーク履歴を更新
  Future<void> updateTalkHistory(TalkHistory updateTalkHistoryData) async {
    await state
        .doc(updateTalkHistoryData.talkId)
        .update(updateTalkHistoryData.toJson());
  }

  /// talkRoomIdに紐づくtalk_historyコレクション全体を削除
  Future<void> deleteAllTalkHistory() async {
    final QuerySnapshot<TalkHistory> snapshot = await state.get();
    for (final QueryDocumentSnapshot<TalkHistory> doc in snapshot.docs) {
      await doc.reference.delete();
      final TalkHistory talkHistoryData = doc.data();
      // 画像の削除
      if (talkHistoryData.imageUrl.isNotEmpty) {
        await ref
            .read(storageControllerProvider.notifier)
            .deleteImage(
              folderName:
                  '${FirebaseStorageKey.talkImageCollection}/$talkRoomId',
              docId: talkHistoryData.talkId,
            );
      }
    }
  }

  /// streamでtalkRoomIdに紐づくtalk_historyコレクションを全て取得
  Stream<List<TalkHistory>> watchAllTalkHistory() {
    return state
        .orderBy(FirebaseTalkHistoryDataKey.createdAt, descending: true)
        .snapshots()
        .map(
          (QuerySnapshot<TalkHistory> snapshot) =>
              snapshot.docs.map((doc) => doc.data()).toList(),
        );
  }

  ///  streamでtalkRoomIdに紐づく最新のtalk_historyコレクションを１件取得
  Stream<TalkHistory?> watchLatestTalkHistory() {
    return state
        .orderBy(FirebaseTalkHistoryDataKey.createdAt, descending: true)
        .limit(1)
        .snapshots()
        .map(
          (QuerySnapshot<TalkHistory> snapshot) =>
              snapshot.docs.isNotEmpty ? snapshot.docs.first.data() : null,
        );
  }
}
