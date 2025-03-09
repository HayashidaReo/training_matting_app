// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userdata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  String get userName => throw _privateConstructorUsedError;
  String get profile => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get iconImageUrl => throw _privateConstructorUsedError;
  String get birthDate => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call({
    String userName,
    String profile,
    String userId,
    String iconImageUrl,
    String birthDate,
    String gender,
    @TimestampConverter() Timestamp createdAt,
    @TimestampConverter() Timestamp updatedAt,
  });
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? profile = null,
    Object? userId = null,
    Object? iconImageUrl = null,
    Object? birthDate = null,
    Object? gender = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            userName:
                null == userName
                    ? _value.userName
                    : userName // ignore: cast_nullable_to_non_nullable
                        as String,
            profile:
                null == profile
                    ? _value.profile
                    : profile // ignore: cast_nullable_to_non_nullable
                        as String,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            iconImageUrl:
                null == iconImageUrl
                    ? _value.iconImageUrl
                    : iconImageUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            birthDate:
                null == birthDate
                    ? _value.birthDate
                    : birthDate // ignore: cast_nullable_to_non_nullable
                        as String,
            gender:
                null == gender
                    ? _value.gender
                    : gender // ignore: cast_nullable_to_non_nullable
                        as String,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as Timestamp,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as Timestamp,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
    _$UserDataImpl value,
    $Res Function(_$UserDataImpl) then,
  ) = __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userName,
    String profile,
    String userId,
    String iconImageUrl,
    String birthDate,
    String gender,
    @TimestampConverter() Timestamp createdAt,
    @TimestampConverter() Timestamp updatedAt,
  });
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
    _$UserDataImpl _value,
    $Res Function(_$UserDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? profile = null,
    Object? userId = null,
    Object? iconImageUrl = null,
    Object? birthDate = null,
    Object? gender = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$UserDataImpl(
        userName:
            null == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                    as String,
        profile:
            null == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        iconImageUrl:
            null == iconImageUrl
                ? _value.iconImageUrl
                : iconImageUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        birthDate:
            null == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                    as String,
        gender:
            null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                    as String,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as Timestamp,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as Timestamp,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  _$UserDataImpl({
    required this.userName,
    required this.profile,
    required this.userId,
    required this.iconImageUrl,
    required this.birthDate,
    required this.gender,
    @TimestampConverter() required this.createdAt,
    @TimestampConverter() required this.updatedAt,
  });

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final String userName;
  @override
  final String profile;
  @override
  final String userId;
  @override
  final String iconImageUrl;
  @override
  final String birthDate;
  @override
  final String gender;
  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;

  @override
  String toString() {
    return 'UserData(userName: $userName, profile: $profile, userId: $userId, iconImageUrl: $iconImageUrl, birthDate: $birthDate, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.iconImageUrl, iconImageUrl) ||
                other.iconImageUrl == iconImageUrl) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userName,
    profile,
    userId,
    iconImageUrl,
    birthDate,
    gender,
    createdAt,
    updatedAt,
  );

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(this);
  }
}

abstract class _UserData implements UserData {
  factory _UserData({
    required final String userName,
    required final String profile,
    required final String userId,
    required final String iconImageUrl,
    required final String birthDate,
    required final String gender,
    @TimestampConverter() required final Timestamp createdAt,
    @TimestampConverter() required final Timestamp updatedAt,
  }) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  String get userName;
  @override
  String get profile;
  @override
  String get userId;
  @override
  String get iconImageUrl;
  @override
  String get birthDate;
  @override
  String get gender;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
