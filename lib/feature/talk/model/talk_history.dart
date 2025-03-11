import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matching_app/function/timestamp_converter.dart';

part 'talk_history.freezed.dart';
part 'talk_history.g.dart';

@freezed
class TalkHistory with _$TalkHistory {
  factory TalkHistory({
    required String talkId,
    required String talkerUserId,
    required String message,
    required String imageUrl,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _TalkHistory;

  factory TalkHistory.fromJson(Map<String, dynamic> json) =>
      _$TalkHistoryFromJson(json);
}
