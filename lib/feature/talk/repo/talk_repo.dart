import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/talk/controller/talk_history_controller.dart';
import 'package:matching_app/feature/talk/model/talk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'talk_repo.g.dart';

@riverpod
class TalkRepo extends _$TalkRepo {
  @override
  CollectionReference<Talk> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebaseTalkDataKey.talkCollection)
        .withConverter<Talk>(
          fromFirestore: (snapshot, _) => Talk.fromJson(snapshot.data()!),
          toFirestore: (Talk value, _) => value.toJson(),
        );
  }

  /// TalkRoomを作成
  Future<void> createTalkRoom(Talk addTalkData) async {
    await state.doc(addTalkData.talkRoomId).set(addTalkData);
  }

  /// TalkRoomを削除
  Future<void> deleteTalkRoom(String talkRoomId) async {
    await state.doc(talkRoomId).delete();
    ref
        .read(talkHistoryControllerProvider.notifier)
        .deleteAllTalkHistory(talkRoomId: talkRoomId);
  }

  /// TalkRoomのupdateAtを更新
  Future<void> updateUpdateAtOfTalkRoom(String talkRoomId) async {
    await state.doc(talkRoomId).update({
      FirebaseTalkDataKey.updatedAt: Timestamp.now(),
    });
  }

  /// トークルーム一覧を取得
  Stream<List<Talk>> watchAllTalkRoomList() {
    return state
        .where(
          FirebaseTalkDataKey.userIds,
          arrayContains: ref.read(currentUserControllerProvider)!.uid,
        )
        .orderBy(FirebaseTalkDataKey.updatedAt, descending: true)
        .snapshots()
        .map((QuerySnapshot<Talk> snapshot) {
          return snapshot.docs.map((QueryDocumentSnapshot<Talk> doc) {
            return doc.data();
          }).toList();
        });
  }

  /// 指定したトークルームの部屋があるかどうかを監視する
  Stream<bool> watchExistTalkRoom(String talkRoomId) {
    return state.doc(talkRoomId).snapshots().map((DocumentSnapshot<Talk> doc) {
      return doc.exists;
    });
  }
}
