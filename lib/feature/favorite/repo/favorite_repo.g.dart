// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchMyAllFavoritesHash() =>
    r'607b3d1b761e5da3cbb5138e0b8c207feaba4331';

/// 自分がいいねしたfavoritesコレクションを全て取得して監視
///
/// Copied from [watchMyAllFavorites].
@ProviderFor(watchMyAllFavorites)
final watchMyAllFavoritesProvider =
    AutoDisposeStreamProvider<List<Favorite>>.internal(
      watchMyAllFavorites,
      name: r'watchMyAllFavoritesProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchMyAllFavoritesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchMyAllFavoritesRef = AutoDisposeStreamProviderRef<List<Favorite>>;
String _$watchAllFavoritesHash() => r'781d09429ae18a1372f322afb3d8790091069dce';

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
/// Copied from [watchAllFavorites].
@ProviderFor(watchAllFavorites)
const watchAllFavoritesProvider = WatchAllFavoritesFamily();

/// streamでpostに紐づくfavoritesコレクションを全て取得して監視
///
/// Copied from [watchAllFavorites].
class WatchAllFavoritesFamily extends Family<AsyncValue<List<Favorite>>> {
  /// streamでpostに紐づくfavoritesコレクションを全て取得して監視
  ///
  /// Copied from [watchAllFavorites].
  const WatchAllFavoritesFamily();

  /// streamでpostに紐づくfavoritesコレクションを全て取得して監視
  ///
  /// Copied from [watchAllFavorites].
  WatchAllFavoritesProvider call(String postId) {
    return WatchAllFavoritesProvider(postId);
  }

  @override
  WatchAllFavoritesProvider getProviderOverride(
    covariant WatchAllFavoritesProvider provider,
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
  String? get name => r'watchAllFavoritesProvider';
}

/// streamでpostに紐づくfavoritesコレクションを全て取得して監視
///
/// Copied from [watchAllFavorites].
class WatchAllFavoritesProvider
    extends AutoDisposeStreamProvider<List<Favorite>> {
  /// streamでpostに紐づくfavoritesコレクションを全て取得して監視
  ///
  /// Copied from [watchAllFavorites].
  WatchAllFavoritesProvider(String postId)
    : this._internal(
        (ref) => watchAllFavorites(ref as WatchAllFavoritesRef, postId),
        from: watchAllFavoritesProvider,
        name: r'watchAllFavoritesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchAllFavoritesHash,
        dependencies: WatchAllFavoritesFamily._dependencies,
        allTransitiveDependencies:
            WatchAllFavoritesFamily._allTransitiveDependencies,
        postId: postId,
      );

  WatchAllFavoritesProvider._internal(
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
    Stream<List<Favorite>> Function(WatchAllFavoritesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchAllFavoritesProvider._internal(
        (ref) => create(ref as WatchAllFavoritesRef),
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
    return _WatchAllFavoritesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchAllFavoritesProvider && other.postId == postId;
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
mixin WatchAllFavoritesRef on AutoDisposeStreamProviderRef<List<Favorite>> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _WatchAllFavoritesProviderElement
    extends AutoDisposeStreamProviderElement<List<Favorite>>
    with WatchAllFavoritesRef {
  _WatchAllFavoritesProviderElement(super.provider);

  @override
  String get postId => (origin as WatchAllFavoritesProvider).postId;
}

String _$favoriteRepoHash() => r'2440434c100adcc112c7635ae611a9627363cbe3';

abstract class _$FavoriteRepo
    extends BuildlessAutoDisposeNotifier<CollectionReference<Favorite>> {
  late final String postId;

  CollectionReference<Favorite> build(String postId);
}

/// See also [FavoriteRepo].
@ProviderFor(FavoriteRepo)
const favoriteRepoProvider = FavoriteRepoFamily();

/// See also [FavoriteRepo].
class FavoriteRepoFamily extends Family<CollectionReference<Favorite>> {
  /// See also [FavoriteRepo].
  const FavoriteRepoFamily();

  /// See also [FavoriteRepo].
  FavoriteRepoProvider call(String postId) {
    return FavoriteRepoProvider(postId);
  }

  @override
  FavoriteRepoProvider getProviderOverride(
    covariant FavoriteRepoProvider provider,
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
  String? get name => r'favoriteRepoProvider';
}

/// See also [FavoriteRepo].
class FavoriteRepoProvider
    extends
        AutoDisposeNotifierProviderImpl<
          FavoriteRepo,
          CollectionReference<Favorite>
        > {
  /// See also [FavoriteRepo].
  FavoriteRepoProvider(String postId)
    : this._internal(
        () => FavoriteRepo()..postId = postId,
        from: favoriteRepoProvider,
        name: r'favoriteRepoProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$favoriteRepoHash,
        dependencies: FavoriteRepoFamily._dependencies,
        allTransitiveDependencies:
            FavoriteRepoFamily._allTransitiveDependencies,
        postId: postId,
      );

  FavoriteRepoProvider._internal(
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
  CollectionReference<Favorite> runNotifierBuild(
    covariant FavoriteRepo notifier,
  ) {
    return notifier.build(postId);
  }

  @override
  Override overrideWith(FavoriteRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: FavoriteRepoProvider._internal(
        () => create()..postId = postId,
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
  AutoDisposeNotifierProviderElement<
    FavoriteRepo,
    CollectionReference<Favorite>
  >
  createElement() {
    return _FavoriteRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteRepoProvider && other.postId == postId;
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
mixin FavoriteRepoRef
    on AutoDisposeNotifierProviderRef<CollectionReference<Favorite>> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _FavoriteRepoProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          FavoriteRepo,
          CollectionReference<Favorite>
        >
    with FavoriteRepoRef {
  _FavoriteRepoProviderElement(super.provider);

  @override
  String get postId => (origin as FavoriteRepoProvider).postId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
