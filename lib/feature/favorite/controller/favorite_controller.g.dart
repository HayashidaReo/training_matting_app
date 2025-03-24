// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchMyAllFavoritesControllerHash() =>
    r'7466eb4a1ebf421a521ef79cd94fce848294868b';

/// 自分がいいねしたfavoritesコレクションを全て取得して監視
///
/// Copied from [watchMyAllFavoritesController].
@ProviderFor(watchMyAllFavoritesController)
final watchMyAllFavoritesControllerProvider =
    AutoDisposeStreamProvider<List<Favorite>>.internal(
      watchMyAllFavoritesController,
      name: r'watchMyAllFavoritesControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchMyAllFavoritesControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchMyAllFavoritesControllerRef =
    AutoDisposeStreamProviderRef<List<Favorite>>;
String _$watchAllFavoritesControllerHash() =>
    r'3e4a67a661eb5550a5af6961ce905e596afee37e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// streamでpostに紐づくfavoritesコレクションを全て取得して監視
///
/// Copied from [watchAllFavoritesController].
@ProviderFor(watchAllFavoritesController)
const watchAllFavoritesControllerProvider = WatchAllFavoritesControllerFamily();

/// streamでpostに紐づくfavoritesコレクションを全て取得して監視
///
/// Copied from [watchAllFavoritesController].
class WatchAllFavoritesControllerFamily
    extends Family<AsyncValue<List<Favorite>>> {
  /// streamでpostに紐づくfavoritesコレクションを全て取得して監視
  ///
  /// Copied from [watchAllFavoritesController].
  const WatchAllFavoritesControllerFamily();

  /// streamでpostに紐づくfavoritesコレクションを全て取得して監視
  ///
  /// Copied from [watchAllFavoritesController].
  WatchAllFavoritesControllerProvider call(String postId) {
    return WatchAllFavoritesControllerProvider(postId);
  }

  @override
  WatchAllFavoritesControllerProvider getProviderOverride(
    covariant WatchAllFavoritesControllerProvider provider,
  ) {
    return call(provider.postId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchAllFavoritesControllerProvider';
}

/// streamでpostに紐づくfavoritesコレクションを全て取得して監視
///
/// Copied from [watchAllFavoritesController].
class WatchAllFavoritesControllerProvider
    extends AutoDisposeStreamProvider<List<Favorite>> {
  /// streamでpostに紐づくfavoritesコレクションを全て取得して監視
  ///
  /// Copied from [watchAllFavoritesController].
  WatchAllFavoritesControllerProvider(String postId)
    : this._internal(
        (ref) => watchAllFavoritesController(
          ref as WatchAllFavoritesControllerRef,
          postId,
        ),
        from: watchAllFavoritesControllerProvider,
        name: r'watchAllFavoritesControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchAllFavoritesControllerHash,
        dependencies: WatchAllFavoritesControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchAllFavoritesControllerFamily._allTransitiveDependencies,
        postId: postId,
      );

  WatchAllFavoritesControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  Override overrideWith(
    Stream<List<Favorite>> Function(WatchAllFavoritesControllerRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchAllFavoritesControllerProvider._internal(
        (ref) => create(ref as WatchAllFavoritesControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Favorite>> createElement() {
    return _WatchAllFavoritesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchAllFavoritesControllerProvider &&
        other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchAllFavoritesControllerRef
    on AutoDisposeStreamProviderRef<List<Favorite>> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _WatchAllFavoritesControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<Favorite>>
    with WatchAllFavoritesControllerRef {
  _WatchAllFavoritesControllerProviderElement(super.provider);

  @override
  String get postId => (origin as WatchAllFavoritesControllerProvider).postId;
}

String _$favoriteControllerHash() =>
    r'71eeae09feb8b207c484ed75ffa123b920444a27';

/// See also [FavoriteController].
@ProviderFor(FavoriteController)
final favoriteControllerProvider =
    AutoDisposeNotifierProvider<FavoriteController, AsyncValue>.internal(
      FavoriteController.new,
      name: r'favoriteControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$favoriteControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FavoriteController = AutoDisposeNotifier<AsyncValue>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
