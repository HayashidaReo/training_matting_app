// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Follow _$FollowFromJson(Map<String, dynamic> json) => _Follow(
  followerUserId: json['followerUserId'] as String,
  followingUserId: json['followingUserId'] as String,
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
  updatedAt: const TimestampConverter().fromJson(
    json['updatedAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$FollowToJson(_Follow instance) => <String, dynamic>{
  'followerUserId': instance.followerUserId,
  'followingUserId': instance.followingUserId,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
};
