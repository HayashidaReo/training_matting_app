// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchMyAllBookmarksControllerHash() =>
    r'bf4fb39c437da5fe5ed40f42362e1a0515e4cc49';

/// See also [watchMyAllBookmarksController].
@ProviderFor(watchMyAllBookmarksController)
final watchMyAllBookmarksControllerProvider =
    AutoDisposeStreamProvider<List<Bookmark>>.internal(
      watchMyAllBookmarksController,
      name: r'watchMyAllBookmarksControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchMyAllBookmarksControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchMyAllBookmarksControllerRef =
    AutoDisposeStreamProviderRef<List<Bookmark>>;
String _$watchAllBookmarksControllerHash() =>
    r'aea18998ae013e4b8687b5ed306632080d998bd1';

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

/// streamでpostに紐づくbookmarksコレクションを全て取得して監視
///
/// Copied from [watchAllBookmarksController].
@ProviderFor(watchAllBookmarksController)
const watchAllBookmarksControllerProvider = WatchAllBookmarksControllerFamily();

/// streamでpostに紐づくbookmarksコレクションを全て取得して監視
///
/// Copied from [watchAllBookmarksController].
class WatchAllBookmarksControllerFamily
    extends Family<AsyncValue<List<Bookmark>>> {
  /// streamでpostに紐づくbookmarksコレクションを全て取得して監視
  ///
  /// Copied from [watchAllBookmarksController].
  const WatchAllBookmarksControllerFamily();

  /// streamでpostに紐づくbookmarksコレクションを全て取得して監視
  ///
  /// Copied from [watchAllBookmarksController].
  WatchAllBookmarksControllerProvider call(String postId) {
    return WatchAllBookmarksControllerProvider(postId);
  }

  @override
  WatchAllBookmarksControllerProvider getProviderOverride(
    covariant WatchAllBookmarksControllerProvider provider,
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
  String? get name => r'watchAllBookmarksControllerProvider';
}

/// streamでpostに紐づくbookmarksコレクションを全て取得して監視
///
/// Copied from [watchAllBookmarksController].
class WatchAllBookmarksControllerProvider
    extends AutoDisposeStreamProvider<List<Bookmark>> {
  /// streamでpostに紐づくbookmarksコレクションを全て取得して監視
  ///
  /// Copied from [watchAllBookmarksController].
  WatchAllBookmarksControllerProvider(String postId)
    : this._internal(
        (ref) => watchAllBookmarksController(
          ref as WatchAllBookmarksControllerRef,
          postId,
        ),
        from: watchAllBookmarksControllerProvider,
        name: r'watchAllBookmarksControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchAllBookmarksControllerHash,
        dependencies: WatchAllBookmarksControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchAllBookmarksControllerFamily._allTransitiveDependencies,
        postId: postId,
      );

  WatchAllBookmarksControllerProvider._internal(
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
    Stream<List<Bookmark>> Function(WatchAllBookmarksControllerRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchAllBookmarksControllerProvider._internal(
        (ref) => create(ref as WatchAllBookmarksControllerRef),
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
  AutoDisposeStreamProviderElement<List<Bookmark>> createElement() {
    return _WatchAllBookmarksControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchAllBookmarksControllerProvider &&
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
mixin WatchAllBookmarksControllerRef
    on AutoDisposeStreamProviderRef<List<Bookmark>> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _WatchAllBookmarksControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<Bookmark>>
    with WatchAllBookmarksControllerRef {
  _WatchAllBookmarksControllerProviderElement(super.provider);

  @override
  String get postId => (origin as WatchAllBookmarksControllerProvider).postId;
}

String _$bookmarkControllerHash() =>
    r'40243475516a07f05b73b4765d423eec2d270181';

/// See also [BookmarkController].
@ProviderFor(BookmarkController)
final bookmarkControllerProvider =
    AutoDisposeNotifierProvider<BookmarkController, AsyncValue>.internal(
      BookmarkController.new,
      name: r'bookmarkControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$bookmarkControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BookmarkController = AutoDisposeNotifier<AsyncValue>;
String _$myAllBookmarksLimitControllerHash() =>
    r'0abf44223b3d86e33476da7ecafa8218c5041bac';

/// See also [MyAllBookmarksLimitController].
@ProviderFor(MyAllBookmarksLimitController)
final myAllBookmarksLimitControllerProvider =
    AutoDisposeNotifierProvider<MyAllBookmarksLimitController, int>.internal(
      MyAllBookmarksLimitController.new,
      name: r'myAllBookmarksLimitControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$myAllBookmarksLimitControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MyAllBookmarksLimitController = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
