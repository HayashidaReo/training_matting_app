import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matching_app/function/timestamp_converter.dart';

part 'talk.freezed.dart';
part 'talk.g.dart';

@freezed
class Talk with _$Talk {
  factory Talk({
    required String talkRoomId,
    required List<String> userIds,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _Talk;

  factory Talk.fromJson(Map<String, dynamic> json) => _$TalkFromJson(json);
}
