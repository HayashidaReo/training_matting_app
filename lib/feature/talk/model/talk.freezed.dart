// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'talk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Talk {

 String get talkRoomId=> throw _privateConstructorUsedError; List<String> get userIds=> throw _privateConstructorUsedError; Map<String, TalkHistory> get talkHistory=> throw _privateConstructorUsedError;@TimestampConverter() Timestamp get createdAt=> throw _privateConstructorUsedError;@TimestampConverter() Timestamp get updatedAt=> throw _privateConstructorUsedError;
/// Create a copy of Talk
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TalkCopyWith<Talk> get copyWith => _$TalkCopyWithImpl<Talk>(this as Talk, _$identity);

  /// Serializes this Talk to a JSON map.
  Map<String, dynamic> toJson()=> throw _privateConstructorUsedError;


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Talk&&(identical(other.talkRoomId, talkRoomId) || other.talkRoomId == talkRoomId)&&const DeepCollectionEquality().equals(other.userIds, userIds)&&const DeepCollectionEquality().equals(other.talkHistory, talkHistory)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,talkRoomId,const DeepCollectionEquality().hash(userIds),const DeepCollectionEquality().hash(talkHistory),createdAt,updatedAt);

@override
String toString() {
  return 'Talk(talkRoomId: $talkRoomId, userIds: $userIds, talkHistory: $talkHistory, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TalkCopyWith<$Res>  {
  factory $TalkCopyWith(Talk value, $Res Function(Talk) _then) = _$TalkCopyWithImpl;
@useResult
$Res call({
 String talkRoomId, List<String> userIds, Map<String, TalkHistory> talkHistory,@TimestampConverter() Timestamp createdAt,@TimestampConverter() Timestamp updatedAt
});




}
/// @nodoc
class _$TalkCopyWithImpl<$Res>
    implements $TalkCopyWith<$Res> {
  _$TalkCopyWithImpl(this._self, this._then);

  final Talk _self;
  final $Res Function(Talk) _then;

/// Create a copy of Talk
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? talkRoomId = null,Object? userIds = null,Object? talkHistory = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
talkRoomId: null == talkRoomId ? _self.talkRoomId : talkRoomId // ignore: cast_nullable_to_non_nullable
as String,userIds: null == userIds ? _self.userIds : userIds // ignore: cast_nullable_to_non_nullable
as List<String>,talkHistory: null == talkHistory ? _self.talkHistory : talkHistory // ignore: cast_nullable_to_non_nullable
as Map<String, TalkHistory>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Talk implements Talk {
   _Talk({required this.talkRoomId, required final  List<String> userIds, required final  Map<String, TalkHistory> talkHistory, @TimestampConverter() required this.createdAt, @TimestampConverter() required this.updatedAt}): _userIds = userIds,_talkHistory = talkHistory;
  factory _Talk.fromJson(Map<String, dynamic> json) => _$TalkFromJson(json);

@override final  String talkRoomId;
 final  List<String> _userIds;
@override List<String> get userIds {
  if (_userIds is EqualUnmodifiableListView) return _userIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userIds);
}

 final  Map<String, TalkHistory> _talkHistory;
@override Map<String, TalkHistory> get talkHistory {
  if (_talkHistory is EqualUnmodifiableMapView) return _talkHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_talkHistory);
}

@override@TimestampConverter() final  Timestamp createdAt;
@override@TimestampConverter() final  Timestamp updatedAt;

/// Create a copy of Talk
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TalkCopyWith<_Talk> get copyWith => __$TalkCopyWithImpl<_Talk>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TalkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Talk&&(identical(other.talkRoomId, talkRoomId) || other.talkRoomId == talkRoomId)&&const DeepCollectionEquality().equals(other._userIds, _userIds)&&const DeepCollectionEquality().equals(other._talkHistory, _talkHistory)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,talkRoomId,const DeepCollectionEquality().hash(_userIds),const DeepCollectionEquality().hash(_talkHistory),createdAt,updatedAt);

@override
String toString() {
  return 'Talk(talkRoomId: $talkRoomId, userIds: $userIds, talkHistory: $talkHistory, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TalkCopyWith<$Res> implements $TalkCopyWith<$Res> {
  factory _$TalkCopyWith(_Talk value, $Res Function(_Talk) _then) = __$TalkCopyWithImpl;
@override @useResult
$Res call({
 String talkRoomId, List<String> userIds, Map<String, TalkHistory> talkHistory,@TimestampConverter() Timestamp createdAt,@TimestampConverter() Timestamp updatedAt
});




}
/// @nodoc
class __$TalkCopyWithImpl<$Res>
    implements _$TalkCopyWith<$Res> {
  __$TalkCopyWithImpl(this._self, this._then);

  final _Talk _self;
  final $Res Function(_Talk) _then;

/// Create a copy of Talk
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? talkRoomId = null,Object? userIds = null,Object? talkHistory = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Talk(
talkRoomId: null == talkRoomId ? _self.talkRoomId : talkRoomId // ignore: cast_nullable_to_non_nullable
as String,userIds: null == userIds ? _self._userIds : userIds // ignore: cast_nullable_to_non_nullable
as List<String>,talkHistory: null == talkHistory ? _self._talkHistory : talkHistory // ignore: cast_nullable_to_non_nullable
as Map<String, TalkHistory>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}


}

// dart format on
