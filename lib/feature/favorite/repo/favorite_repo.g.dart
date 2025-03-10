// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteRepoHash() => r'22810bd0add9211399a6a3fa85b425293fec6545';

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
