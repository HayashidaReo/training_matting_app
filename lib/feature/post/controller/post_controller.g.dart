// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchAllPostsControllerHash() =>
    r'c5a3e480f542734877927269c232667fa4554788';

/// See also [watchAllPostsController].
@ProviderFor(watchAllPostsController)
final watchAllPostsControllerProvider =
    AutoDisposeStreamProvider<List<Post>>.internal(
      watchAllPostsController,
      name: r'watchAllPostsControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchAllPostsControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllPostsControllerRef = AutoDisposeStreamProviderRef<List<Post>>;
String _$watchMyAllPostsControllerHash() =>
    r'b10c716c7ef25fc954bea94a0f3a53c64acfcfd1';

/// See also [watchMyAllPostsController].
@ProviderFor(watchMyAllPostsController)
final watchMyAllPostsControllerProvider =
    AutoDisposeStreamProvider<List<Post>>.internal(
      watchMyAllPostsController,
      name: r'watchMyAllPostsControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchMyAllPostsControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchMyAllPostsControllerRef = AutoDisposeStreamProviderRef<List<Post>>;
String _$watchPostControllerHash() =>
    r'7a6d6d4ff799b3ffc750665962993d466390ba39';

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

/// See also [watchPostController].
@ProviderFor(watchPostController)
const watchPostControllerProvider = WatchPostControllerFamily();

/// See also [watchPostController].
class WatchPostControllerFamily extends Family<AsyncValue<Post?>> {
  /// See also [watchPostController].
  const WatchPostControllerFamily();

  /// See also [watchPostController].
  WatchPostControllerProvider call(String postId) {
    return WatchPostControllerProvider(postId);
  }

  @override
  WatchPostControllerProvider getProviderOverride(
    covariant WatchPostControllerProvider provider,
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
  String? get name => r'watchPostControllerProvider';
}

/// See also [watchPostController].
class WatchPostControllerProvider extends AutoDisposeStreamProvider<Post?> {
  /// See also [watchPostController].
  WatchPostControllerProvider(String postId)
    : this._internal(
        (ref) => watchPostController(ref as WatchPostControllerRef, postId),
        from: watchPostControllerProvider,
        name: r'watchPostControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchPostControllerHash,
        dependencies: WatchPostControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchPostControllerFamily._allTransitiveDependencies,
        postId: postId,
      );

  WatchPostControllerProvider._internal(
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
    Stream<Post?> Function(WatchPostControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchPostControllerProvider._internal(
        (ref) => create(ref as WatchPostControllerRef),
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
  AutoDisposeStreamProviderElement<Post?> createElement() {
    return _WatchPostControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchPostControllerProvider && other.postId == postId;
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
mixin WatchPostControllerRef on AutoDisposeStreamProviderRef<Post?> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _WatchPostControllerProviderElement
    extends AutoDisposeStreamProviderElement<Post?>
    with WatchPostControllerRef {
  _WatchPostControllerProviderElement(super.provider);

  @override
  String get postId => (origin as WatchPostControllerProvider).postId;
}

String _$watchMyAllBookmarkPostsControllerHash() =>
    r'a4824d2a3f387f19db7d042fe90c4e5df174037f';

/// See also [watchMyAllBookmarkPostsController].
@ProviderFor(watchMyAllBookmarkPostsController)
final watchMyAllBookmarkPostsControllerProvider =
    AutoDisposeStreamProvider<List<Post>>.internal(
      watchMyAllBookmarkPostsController,
      name: r'watchMyAllBookmarkPostsControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchMyAllBookmarkPostsControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchMyAllBookmarkPostsControllerRef =
    AutoDisposeStreamProviderRef<List<Post>>;
String _$postControllerHash() => r'02c69dd47e7173339c79422923e29347ecdc4c35';

/// See also [PostController].
@ProviderFor(PostController)
final postControllerProvider =
    AutoDisposeNotifierProvider<PostController, AsyncValue>.internal(
      PostController.new,
      name: r'postControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$postControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PostController = AutoDisposeNotifier<AsyncValue>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
