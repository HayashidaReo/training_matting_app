// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talk_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TalkHistory _$TalkHistoryFromJson(Map<String, dynamic> json) => _TalkHistory(
  talkId: json['talkId'] as String,
  talkRoomId: json['talkRoomId'] as String,
  talkerUserId: json['talkerUserId'] as String,
  userIds: (json['userIds'] as List<dynamic>).map((e) => e as String).toList(),
  isOpened: json['isOpened'] as bool,
  message: json['message'] as String,
  imageUrl: json['imageUrl'] as String,
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
  updatedAt: const TimestampConverter().fromJson(
    json['updatedAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$TalkHistoryToJson(_TalkHistory instance) =>
    <String, dynamic>{
      'talkId': instance.talkId,
      'talkRoomId': instance.talkRoomId,
      'talkerUserId': instance.talkerUserId,
      'userIds': instance.userIds,
      'isOpened': instance.isOpened,
      'message': instance.message,
      'imageUrl': instance.imageUrl,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
