// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
  body: json['body'] as String,
  userId: json['userId'] as String,
  postId: json['postId'] as String,
  imageUrl: json['imageUrl'] as String,
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
  updatedAt: const TimestampConverter().fromJson(
    json['updatedAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
  'body': instance.body,
  'userId': instance.userId,
  'postId': instance.postId,
  'imageUrl': instance.imageUrl,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
};
