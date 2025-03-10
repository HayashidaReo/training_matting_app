// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookmarkRepoHash() => r'6792cf2766fd482c69d03d964f90575d7d17b96c';

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

abstract class _$BookmarkRepo
    extends BuildlessAutoDisposeNotifier<CollectionReference<Bookmark>> {
  late final String postId;

  CollectionReference<Bookmark> build(String postId);
}

/// See also [BookmarkRepo].
@ProviderFor(BookmarkRepo)
const bookmarkRepoProvider = BookmarkRepoFamily();

/// See also [BookmarkRepo].
class BookmarkRepoFamily extends Family<CollectionReference<Bookmark>> {
  /// See also [BookmarkRepo].
  const BookmarkRepoFamily();

  /// See also [BookmarkRepo].
  BookmarkRepoProvider call(String postId) {
    return BookmarkRepoProvider(postId);
  }

  @override
  BookmarkRepoProvider getProviderOverride(
    covariant BookmarkRepoProvider provider,
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
  String? get name => r'bookmarkRepoProvider';
}

/// See also [BookmarkRepo].
class BookmarkRepoProvider
    extends
        AutoDisposeNotifierProviderImpl<
          BookmarkRepo,
          CollectionReference<Bookmark>
        > {
  /// See also [BookmarkRepo].
  BookmarkRepoProvider(String postId)
    : this._internal(
        () => BookmarkRepo()..postId = postId,
        from: bookmarkRepoProvider,
        name: r'bookmarkRepoProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$bookmarkRepoHash,
        dependencies: BookmarkRepoFamily._dependencies,
        allTransitiveDependencies:
            BookmarkRepoFamily._allTransitiveDependencies,
        postId: postId,
      );

  BookmarkRepoProvider._internal(
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
  CollectionReference<Bookmark> runNotifierBuild(
    covariant BookmarkRepo notifier,
  ) {
    return notifier.build(postId);
  }

  @override
  Override overrideWith(BookmarkRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: BookmarkRepoProvider._internal(
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
    BookmarkRepo,
    CollectionReference<Bookmark>
  >
  createElement() {
    return _BookmarkRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookmarkRepoProvider && other.postId == postId;
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
mixin BookmarkRepoRef
    on AutoDisposeNotifierProviderRef<CollectionReference<Bookmark>> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _BookmarkRepoProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          BookmarkRepo,
          CollectionReference<Bookmark>
        >
    with BookmarkRepoRef {
  _BookmarkRepoProviderElement(super.provider);

  @override
  String get postId => (origin as BookmarkRepoProvider).postId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
