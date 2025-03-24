// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
  userName: json['userName'] as String,
  profile: json['profile'] as String,
  userId: json['userId'] as String,
  iconImageUrl: json['iconImageUrl'] as String,
  birthDate: json['birthDate'] as String,
  gender: (json['gender'] as num).toInt(),
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
  updatedAt: const TimestampConverter().fromJson(
    json['updatedAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
  'userName': instance.userName,
  'profile': instance.profile,
  'userId': instance.userId,
  'iconImageUrl': instance.iconImageUrl,
  'birthDate': instance.birthDate,
  'gender': instance.gender,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
};
