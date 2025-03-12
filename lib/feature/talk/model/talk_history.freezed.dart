// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'talk_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TalkHistory {

 String get talkId => throw _privateConstructorUsedError; String get talkRoomId => throw _privateConstructorUsedError; String get talkerUserId => throw _privateConstructorUsedError; bool get isOpened => throw _privateConstructorUsedError; String get message => throw _privateConstructorUsedError; String get imageUrl => throw _privateConstructorUsedError;@TimestampConverter() Timestamp get createdAt => throw _privateConstructorUsedError;@TimestampConverter() Timestamp get updatedAt => throw _privateConstructorUsedError;
/// Create a copy of TalkHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TalkHistoryCopyWith<TalkHistory> get copyWith => _$TalkHistoryCopyWithImpl<TalkHistory>(this as TalkHistory, _$identity);

  /// Serializes this TalkHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TalkHistory&&(identical(other.talkId, talkId) || other.talkId == talkId)&&(identical(other.talkRoomId, talkRoomId) || other.talkRoomId == talkRoomId)&&(identical(other.talkerUserId, talkerUserId) || other.talkerUserId == talkerUserId)&&(identical(other.isOpened, isOpened) || other.isOpened == isOpened)&&(identical(other.message, message) || other.message == message)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,talkId,talkRoomId,talkerUserId,isOpened,message,imageUrl,createdAt,updatedAt);

@override
String toString() {
  return 'TalkHistory(talkId: $talkId, talkRoomId: $talkRoomId, talkerUserId: $talkerUserId, isOpened: $isOpened, message: $message, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TalkHistoryCopyWith<$Res>  {
  factory $TalkHistoryCopyWith(TalkHistory value, $Res Function(TalkHistory) _then) = _$TalkHistoryCopyWithImpl;
@useResult
$Res call({
 String talkId, String talkRoomId, String talkerUserId, bool isOpened, String message, String imageUrl,@TimestampConverter() Timestamp createdAt,@TimestampConverter() Timestamp updatedAt
});




}
/// @nodoc
class _$TalkHistoryCopyWithImpl<$Res>
    implements $TalkHistoryCopyWith<$Res> {
  _$TalkHistoryCopyWithImpl(this._self, this._then);

  final TalkHistory _self;
  final $Res Function(TalkHistory) _then;

/// Create a copy of TalkHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? talkId = null,Object? talkRoomId = null,Object? talkerUserId = null,Object? isOpened = null,Object? message = null,Object? imageUrl = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
talkId: null == talkId ? _self.talkId : talkId // ignore: cast_nullable_to_non_nullable
as String,talkRoomId: null == talkRoomId ? _self.talkRoomId : talkRoomId // ignore: cast_nullable_to_non_nullable
as String,talkerUserId: null == talkerUserId ? _self.talkerUserId : talkerUserId // ignore: cast_nullable_to_non_nullable
as String,isOpened: null == isOpened ? _self.isOpened : isOpened // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TalkHistory implements TalkHistory {
   _TalkHistory({required this.talkId, required this.talkRoomId, required this.talkerUserId, required this.isOpened, required this.message, required this.imageUrl, @TimestampConverter() required this.createdAt, @TimestampConverter() required this.updatedAt});
  factory _TalkHistory.fromJson(Map<String, dynamic> json) => _$TalkHistoryFromJson(json);

@override final  String talkId;
@override final  String talkRoomId;
@override final  String talkerUserId;
@override final  bool isOpened;
@override final  String message;
@override final  String imageUrl;
@override@TimestampConverter() final  Timestamp createdAt;
@override@TimestampConverter() final  Timestamp updatedAt;

/// Create a copy of TalkHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TalkHistoryCopyWith<_TalkHistory> get copyWith => __$TalkHistoryCopyWithImpl<_TalkHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TalkHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TalkHistory&&(identical(other.talkId, talkId) || other.talkId == talkId)&&(identical(other.talkRoomId, talkRoomId) || other.talkRoomId == talkRoomId)&&(identical(other.talkerUserId, talkerUserId) || other.talkerUserId == talkerUserId)&&(identical(other.isOpened, isOpened) || other.isOpened == isOpened)&&(identical(other.message, message) || other.message == message)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,talkId,talkRoomId,talkerUserId,isOpened,message,imageUrl,createdAt,updatedAt);

@override
String toString() {
  return 'TalkHistory(talkId: $talkId, talkRoomId: $talkRoomId, talkerUserId: $talkerUserId, isOpened: $isOpened, message: $message, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TalkHistoryCopyWith<$Res> implements $TalkHistoryCopyWith<$Res> {
  factory _$TalkHistoryCopyWith(_TalkHistory value, $Res Function(_TalkHistory) _then) = __$TalkHistoryCopyWithImpl;
@override @useResult
$Res call({
 String talkId, String talkRoomId, String talkerUserId, bool isOpened, String message, String imageUrl,@TimestampConverter() Timestamp createdAt,@TimestampConverter() Timestamp updatedAt
});




}
/// @nodoc
class __$TalkHistoryCopyWithImpl<$Res>
    implements _$TalkHistoryCopyWith<$Res> {
  __$TalkHistoryCopyWithImpl(this._self, this._then);

  final _TalkHistory _self;
  final $Res Function(_TalkHistory) _then;

/// Create a copy of TalkHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? talkId = null,Object? talkRoomId = null,Object? talkerUserId = null,Object? isOpened = null,Object? message = null,Object? imageUrl = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TalkHistory(
talkId: null == talkId ? _self.talkId : talkId // ignore: cast_nullable_to_non_nullable
as String,talkRoomId: null == talkRoomId ? _self.talkRoomId : talkRoomId // ignore: cast_nullable_to_non_nullable
as String,talkerUserId: null == talkerUserId ? _self.talkerUserId : talkerUserId // ignore: cast_nullable_to_non_nullable
as String,isOpened: null == isOpened ? _self.isOpened : isOpened // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}


}

// dart format on
