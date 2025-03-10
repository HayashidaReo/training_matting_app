// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Favorite _$FavoriteFromJson(Map<String, dynamic> json) => _Favorite(
  userId: json['userId'] as String,
  postId: json['postId'] as String,
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
  updatedAt: const TimestampConverter().fromJson(
    json['updatedAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$FavoriteToJson(_Favorite instance) => <String, dynamic>{
  'userId': instance.userId,
  'postId': instance.postId,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
};
