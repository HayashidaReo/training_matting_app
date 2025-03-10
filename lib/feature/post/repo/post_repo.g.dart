// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchAllPostsHash() => r'd3b1aeaf21ef14119d691e941876fe623f417a61';

/// steamで全ての投稿を取得して監視
///
/// Copied from [watchAllPosts].
@ProviderFor(watchAllPosts)
final watchAllPostsProvider = AutoDisposeStreamProvider<List<Post>>.internal(
  watchAllPosts,
  name: r'watchAllPostsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$watchAllPostsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllPostsRef = AutoDisposeStreamProviderRef<List<Post>>;
String _$watchMyAllPostsHash() => r'207bd8f62814a87ec8430bb9f5596f6c4385d626';

/// steamで自分の投稿を全て取得して監視
///
/// Copied from [watchMyAllPosts].
@ProviderFor(watchMyAllPosts)
final watchMyAllPostsProvider = AutoDisposeStreamProvider<List<Post>>.internal(
  watchMyAllPosts,
  name: r'watchMyAllPostsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$watchMyAllPostsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchMyAllPostsRef = AutoDisposeStreamProviderRef<List<Post>>;
String _$watchPostHash() => r'b1531dd5251bbe03536d572965b57c3138d52a0b';

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

/// steamでpostIdからドキュメントを取得して監視
///
/// Copied from [watchPost].
@ProviderFor(watchPost)
const watchPostProvider = WatchPostFamily();

/// steamでpostIdからドキュメントを取得して監視
///
/// Copied from [watchPost].
class WatchPostFamily extends Family<AsyncValue<Post>> {
  /// steamでpostIdからドキュメントを取得して監視
  ///
  /// Copied from [watchPost].
  const WatchPostFamily();

  /// steamでpostIdからドキュメントを取得して監視
  ///
  /// Copied from [watchPost].
  WatchPostProvider call(String postId) {
    return WatchPostProvider(postId);
  }

  @override
  WatchPostProvider getProviderOverride(covariant WatchPostProvider provider) {
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
  String? get name => r'watchPostProvider';
}

/// steamでpostIdからドキュメントを取得して監視
///
/// Copied from [watchPost].
class WatchPostProvider extends AutoDisposeStreamProvider<Post> {
  /// steamでpostIdからドキュメントを取得して監視
  ///
  /// Copied from [watchPost].
  WatchPostProvider(String postId)
    : this._internal(
        (ref) => watchPost(ref as WatchPostRef, postId),
        from: watchPostProvider,
        name: r'watchPostProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchPostHash,
        dependencies: WatchPostFamily._dependencies,
        allTransitiveDependencies: WatchPostFamily._allTransitiveDependencies,
        postId: postId,
      );

  WatchPostProvider._internal(
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
  Override overrideWith(Stream<Post> Function(WatchPostRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: WatchPostProvider._internal(
        (ref) => create(ref as WatchPostRef),
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
  AutoDisposeStreamProviderElement<Post> createElement() {
    return _WatchPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchPostProvider && other.postId == postId;
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
mixin WatchPostRef on AutoDisposeStreamProviderRef<Post> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _WatchPostProviderElement extends AutoDisposeStreamProviderElement<Post>
    with WatchPostRef {
  _WatchPostProviderElement(super.provider);

  @override
  String get postId => (origin as WatchPostProvider).postId;
}

String _$watchMyAllBookmarkPostsHash() =>
    r'dbb9fae0316021119e45f4d697b3f43afd906b52';

/// steamで自分がブックマークしたpostsコレクションを全て取得して監視
///
/// Copied from [watchMyAllBookmarkPosts].
@ProviderFor(watchMyAllBookmarkPosts)
final watchMyAllBookmarkPostsProvider =
    AutoDisposeStreamProvider<List<Post>>.internal(
      watchMyAllBookmarkPosts,
      name: r'watchMyAllBookmarkPostsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchMyAllBookmarkPostsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchMyAllBookmarkPostsRef = AutoDisposeStreamProviderRef<List<Post>>;
String _$postRepoHash() => r'61a6ff2135be91d9e4e60802e4e543047255aa7b';

/// See also [PostRepo].
@ProviderFor(PostRepo)
final postRepoProvider =
    AutoDisposeNotifierProvider<PostRepo, CollectionReference<Post>>.internal(
      PostRepo.new,
      name: r'postRepoProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$postRepoHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PostRepo = AutoDisposeNotifier<CollectionReference<Post>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
