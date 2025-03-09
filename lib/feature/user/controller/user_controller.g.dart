// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchUserDataControllerHash() =>
    r'ff7f24fab42bfc848160f950a41d2a09c41df357';

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

/// See also [watchUserDataController].
@ProviderFor(watchUserDataController)
const watchUserDataControllerProvider = WatchUserDataControllerFamily();

/// See also [watchUserDataController].
class WatchUserDataControllerFamily extends Family<AsyncValue<UserData?>> {
  /// See also [watchUserDataController].
  const WatchUserDataControllerFamily();

  /// See also [watchUserDataController].
  WatchUserDataControllerProvider call(String userId) {
    return WatchUserDataControllerProvider(userId);
  }

  @override
  WatchUserDataControllerProvider getProviderOverride(
    covariant WatchUserDataControllerProvider provider,
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
  String? get name => r'watchUserDataControllerProvider';
}

/// See also [watchUserDataController].
class WatchUserDataControllerProvider
    extends AutoDisposeStreamProvider<UserData?> {
  /// See also [watchUserDataController].
  WatchUserDataControllerProvider(String userId)
    : this._internal(
        (ref) =>
            watchUserDataController(ref as WatchUserDataControllerRef, userId),
        from: watchUserDataControllerProvider,
        name: r'watchUserDataControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchUserDataControllerHash,
        dependencies: WatchUserDataControllerFamily._dependencies,
        allTransitiveDependencies:
            WatchUserDataControllerFamily._allTransitiveDependencies,
        userId: userId,
      );

  WatchUserDataControllerProvider._internal(
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
    Stream<UserData?> Function(WatchUserDataControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchUserDataControllerProvider._internal(
        (ref) => create(ref as WatchUserDataControllerRef),
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
    return _WatchUserDataControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchUserDataControllerProvider && other.userId == userId;
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
mixin WatchUserDataControllerRef on AutoDisposeStreamProviderRef<UserData?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _WatchUserDataControllerProviderElement
    extends AutoDisposeStreamProviderElement<UserData?>
    with WatchUserDataControllerRef {
  _WatchUserDataControllerProviderElement(super.provider);

  @override
  String get userId => (origin as WatchUserDataControllerProvider).userId;
}

String _$watchMyUserDataControllerHash() =>
    r'92695c96f9cc2adf97e39f0874c03fe8d37870c2';

/// See also [watchMyUserDataController].
@ProviderFor(watchMyUserDataController)
final watchMyUserDataControllerProvider =
    AutoDisposeStreamProvider<UserData?>.internal(
      watchMyUserDataController,
      name: r'watchMyUserDataControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchMyUserDataControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchMyUserDataControllerRef = AutoDisposeStreamProviderRef<UserData?>;
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
String _$userControllerHash() => r'5676a11814fd604e8682efd5001fc7582734b2db';

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
