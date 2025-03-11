// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talk_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TalkHistory _$TalkHistoryFromJson(Map<String, dynamic> json) => _TalkHistory(
  talkId: json['talkId'] as String,
  talkerUserId: json['talkerUserId'] as String,
  isOpened: json['isOpened'] as String,
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
      'talkerUserId': instance.talkerUserId,
      'isOpened': instance.isOpened,
      'message': instance.message,
      'imageUrl': instance.imageUrl,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
