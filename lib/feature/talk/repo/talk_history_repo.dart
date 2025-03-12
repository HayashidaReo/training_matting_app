import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/talk/model/talk_history.dart';
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
}
