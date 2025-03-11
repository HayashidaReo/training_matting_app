// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Talk _$TalkFromJson(Map<String, dynamic> json) => _Talk(
  talkRoomId: json['talkRoomId'] as String,
  userIds: (json['userIds'] as List<dynamic>).map((e) => e as String).toList(),
  talkHistory:
      (json['talkHistory'] as List<dynamic>)
          .map((e) => TalkHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
  updatedAt: const TimestampConverter().fromJson(
    json['updatedAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$TalkToJson(_Talk instance) => <String, dynamic>{
  'talkRoomId': instance.talkRoomId,
  'userIds': instance.userIds,
  'talkHistory': instance.talkHistory,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
};
