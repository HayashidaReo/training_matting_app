// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchAccountControllerHash() =>
    r'0ad635189873ba24a8747bd6cc9c0defd7b65372';

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

/// See also [watchAccountController].
@ProviderFor(watchAccountController)
const watchAccountControllerProvider = WatchAccountControllerFamily();

/// See also [watchAccountController].
class WatchAccountControllerFamily extends Family<AsyncValue<UserData?>> {
  /// See also [watchAccountController].
  const WatchAccountControllerFamily();

  /// See also [watchAccountController].
  WatchAccountControllerProvider call(String userId) {
    return WatchAccountControllerProvider(userId);
  }

  @override
  WatchAccountControllerProvider getProviderOverride(
    covariant WatchAccountControllerProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchAccountControllerProvider';
}

/// See also [watchAccountController].
class WatchAccountControllerProvider
    extends AutoDisposeStreamProvider<UserData?> {
  /// See also [watchAccountController].
  WatchAccountControllerProvider(String userId)
    : this._internal(
        (ref) =>
            watchAccountController(ref as WatchAccountControllerRef, userId),
        from: watchAccountControllerProvider,
        name: r'watchAccountControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchAccountControllerHash,
        dependencies: WatchAccountControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchAccountControllerFamily._allTransitiveDependencies,
        userId: userId,
      );

  WatchAccountControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<UserData?> Function(WatchAccountControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchAccountControllerProvider._internal(
        (ref) => create(ref as WatchAccountControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<UserData?> createElement() {
    return _WatchAccountControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchAccountControllerProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchAccountControllerRef on AutoDisposeStreamProviderRef<UserData?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _WatchAccountControllerProviderElement
    extends AutoDisposeStreamProviderElement<UserData?>
    with WatchAccountControllerRef {
  _WatchAccountControllerProviderElement(super.provider);

  @override
  String get userId => (origin as WatchAccountControllerProvider).userId;
}

String _$watchMyAccountControllerHash() =>
    r'488f315101b2c108a332bb0b7f1e7f8fc9870e9a';

/// See also [watchMyAccountController].
@ProviderFor(watchMyAccountController)
final watchMyAccountControllerProvider =
    AutoDisposeStreamProvider<UserData?>.internal(
      watchMyAccountController,
      name: r'watchMyAccountControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchMyAccountControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchMyAccountControllerRef = AutoDisposeStreamProviderRef<UserData?>;
String _$watchUsersControllerHash() =>
    r'f101f553303cdd4023fefb1b023c5451740fac3d';

/// See also [watchUsersController].
@ProviderFor(watchUsersController)
final watchUsersControllerProvider =
    AutoDisposeStreamProvider<List<UserData>>.internal(
      watchUsersController,
      name: r'watchUsersControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchUsersControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchUsersControllerRef = AutoDisposeStreamProviderRef<List<UserData>>;
String _$userControllerHash() => r'551c5337af8d67d98714b72a1e6365d9bbc71d5d';

/// See also [UserController].
@ProviderFor(UserController)
final userControllerProvider =
    AutoDisposeNotifierProvider<UserController, AsyncValue>.internal(
      UserController.new,
      name: r'userControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$userControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UserController = AutoDisposeNotifier<AsyncValue>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
