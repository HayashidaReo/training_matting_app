// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userdata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);


/// @nodoc
mixin _$UserData {

 String get userName => throw _privateConstructorUsedError; String get profile => throw _privateConstructorUsedError; String get userId => throw _privateConstructorUsedError; String get iconImageUrl => throw _privateConstructorUsedError; String get birthDate => throw _privateConstructorUsedError; int get gender => throw _privateConstructorUsedError;@TimestampConverter() Timestamp get createdAt => throw _privateConstructorUsedError;@TimestampConverter() Timestamp get updatedAt => throw _privateConstructorUsedError;
/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataCopyWith<UserData> get copyWith => _$UserDataCopyWithImpl<UserData>(this as UserData, _$identity);

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserData&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.iconImageUrl, iconImageUrl) || other.iconImageUrl == iconImageUrl)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,profile,userId,iconImageUrl,birthDate,gender,createdAt,updatedAt);

@override
String toString() {
  return 'UserData(userName: $userName, profile: $profile, userId: $userId, iconImageUrl: $iconImageUrl, birthDate: $birthDate, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserDataCopyWith<$Res>  {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) _then) = _$UserDataCopyWithImpl;
@useResult
$Res call({
 String userName, String profile, String userId, String iconImageUrl, String birthDate, int gender,@TimestampConverter() Timestamp createdAt,@TimestampConverter() Timestamp updatedAt
});




}
/// @nodoc
class _$UserDataCopyWithImpl<$Res>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._self, this._then);

  final UserData _self;
  final $Res Function(UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = null,Object? profile = null,Object? userId = null,Object? iconImageUrl = null,Object? birthDate = null,Object? gender = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,iconImageUrl: null == iconImageUrl ? _self.iconImageUrl : iconImageUrl // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserData implements UserData {
   _UserData({required this.userName, required this.profile, required this.userId, required this.iconImageUrl, required this.birthDate, required this.gender, @TimestampConverter() required this.createdAt, @TimestampConverter() required this.updatedAt});
  factory _UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

@override final  String userName;
@override final  String profile;
@override final  String userId;
@override final  String iconImageUrl;
@override final  String birthDate;
@override final  int gender;
@override@TimestampConverter() final  Timestamp createdAt;
@override@TimestampConverter() final  Timestamp updatedAt;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDataCopyWith<_UserData> get copyWith => __$UserDataCopyWithImpl<_UserData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserData&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.iconImageUrl, iconImageUrl) || other.iconImageUrl == iconImageUrl)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,profile,userId,iconImageUrl,birthDate,gender,createdAt,updatedAt);

@override
String toString() {
  return 'UserData(userName: $userName, profile: $profile, userId: $userId, iconImageUrl: $iconImageUrl, birthDate: $birthDate, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) _then) = __$UserDataCopyWithImpl;
@override @useResult
$Res call({
 String userName, String profile, String userId, String iconImageUrl, String birthDate, int gender,@TimestampConverter() Timestamp createdAt,@TimestampConverter() Timestamp updatedAt
});




}
/// @nodoc
class __$UserDataCopyWithImpl<$Res>
    implements _$UserDataCopyWith<$Res> {
  __$UserDataCopyWithImpl(this._self, this._then);

  final _UserData _self;
  final $Res Function(_UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = null,Object? profile = null,Object? userId = null,Object? iconImageUrl = null,Object? birthDate = null,Object? gender = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserData(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,iconImageUrl: null == iconImageUrl ? _self.iconImageUrl : iconImageUrl // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}


}

// dart format on
