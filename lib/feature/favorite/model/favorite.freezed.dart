// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Favorite {

 String get userId=> throw _privateConstructorUsedError; String get postId=> throw _privateConstructorUsedError;@TimestampConverter() Timestamp get createdAt=> throw _privateConstructorUsedError;@TimestampConverter() Timestamp get updatedAt=> throw _privateConstructorUsedError;
/// Create a copy of Favorite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteCopyWith<Favorite> get copyWith => _$FavoriteCopyWithImpl<Favorite>(this as Favorite, _$identity);

  /// Serializes this Favorite to a JSON map.
  Map<String, dynamic> toJson()=> throw _privateConstructorUsedError;


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Favorite&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,postId,createdAt,updatedAt);

@override
String toString() {
  return 'Favorite(userId: $userId, postId: $postId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FavoriteCopyWith<$Res>  {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) _then) = _$FavoriteCopyWithImpl;
@useResult
$Res call({
 String userId, String postId,@TimestampConverter() Timestamp createdAt,@TimestampConverter() Timestamp updatedAt
});




}
/// @nodoc
class _$FavoriteCopyWithImpl<$Res>
    implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._self, this._then);

  final Favorite _self;
  final $Res Function(Favorite) _then;

/// Create a copy of Favorite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? postId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Favorite implements Favorite {
   _Favorite({required this.userId, required this.postId, @TimestampConverter() required this.createdAt, @TimestampConverter() required this.updatedAt});
  factory _Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);

@override final  String userId;
@override final  String postId;
@override@TimestampConverter() final  Timestamp createdAt;
@override@TimestampConverter() final  Timestamp updatedAt;

/// Create a copy of Favorite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteCopyWith<_Favorite> get copyWith => __$FavoriteCopyWithImpl<_Favorite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Favorite&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,postId,createdAt,updatedAt);

@override
String toString() {
  return 'Favorite(userId: $userId, postId: $postId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FavoriteCopyWith<$Res> implements $FavoriteCopyWith<$Res> {
  factory _$FavoriteCopyWith(_Favorite value, $Res Function(_Favorite) _then) = __$FavoriteCopyWithImpl;
@override @useResult
$Res call({
 String userId, String postId,@TimestampConverter() Timestamp createdAt,@TimestampConverter() Timestamp updatedAt
});




}
/// @nodoc
class __$FavoriteCopyWithImpl<$Res>
    implements _$FavoriteCopyWith<$Res> {
  __$FavoriteCopyWithImpl(this._self, this._then);

  final _Favorite _self;
  final $Res Function(_Favorite) _then;

/// Create a copy of Favorite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? postId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Favorite(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}


}

// dart format on
