import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_app/config/firebase/firebase_instance_provider.dart';
import 'package:matching_app/config/utils/keys/firebase_key.dart';
import 'package:matching_app/feature/auth/controller/current_user_controller.dart';
import 'package:matching_app/feature/talk/model/talk_history.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'talk_history_group_repo.g.dart';

@riverpod
class TalkHistoryGroupRepo extends _$TalkHistoryGroupRepo {
  @override
  Query<TalkHistory> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collectionGroup(FirebaseTalkHistoryDataKey.talkHistoryCollection)
        .withConverter<TalkHistory>(
          fromFirestore:
              (snapshot, _) => TalkHistory.fromJson(snapshot.data()!),
          toFirestore: (TalkHistory value, _) => value.toJson(),
        );
  }

  /// 全ての未読件数を取得して監視
  Stream<int> watchAllNotOpenedTalkHistoryCount() {
    final myUserId = ref.read(currentUserControllerProvider)!.uid;
    return state
        .where(FirebaseTalkDataKey.userIds, arrayContains: myUserId)
        .where(FirebaseTalkHistoryDataKey.talkerUserId, isNotEqualTo: myUserId)
        .where(FirebaseTalkHistoryDataKey.isOpened, isEqualTo: false)
        .snapshots()
        .map<int>((snapshot) => snapshot.docs.length);
  }
}
