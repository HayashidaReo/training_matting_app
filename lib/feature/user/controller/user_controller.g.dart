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
String _$watchAllUsersControllerHash() =>
    r'f266e1ae7de7f2000752b19c65dbabca7bec318f';

/// See also [watchAllUsersController].
@ProviderFor(watchAllUsersController)
final watchAllUsersControllerProvider =
    AutoDisposeStreamProvider<List<UserData>>.internal(
      watchAllUsersController,
      name: r'watchAllUsersControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$watchAllUsersControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchAllUsersControllerRef =
    AutoDisposeStreamProviderRef<List<UserData>>;
String _$watchForwardMatchingWithQueryTextUsersControllerHash() =>
    r'595c11df828b148fcffd032b72f81191f855942c';

/// See also [watchForwardMatchingWithQueryTextUsersController].
@ProviderFor(watchForwardMatchingWithQueryTextUsersController)
const watchForwardMatchingWithQueryTextUsersControllerProvider =
    WatchForwardMatchingWithQueryTextUsersControllerFamily();

/// See also [watchForwardMatchingWithQueryTextUsersController].
class WatchForwardMatchingWithQueryTextUsersControllerFamily
    extends Family<AsyncValue<List<UserData>>> {
  /// See also [watchForwardMatchingWithQueryTextUsersController].
  const WatchForwardMatchingWithQueryTextUsersControllerFamily();

  /// See also [watchForwardMatchingWithQueryTextUsersController].
  WatchForwardMatchingWithQueryTextUsersControllerProvider call(
    String queryText,
    int? myGender,
  ) {
    return WatchForwardMatchingWithQueryTextUsersControllerProvider(
      queryText,
      myGender,
    );
  }

  @override
  WatchForwardMatchingWithQueryTextUsersControllerProvider getProviderOverride(
    covariant WatchForwardMatchingWithQueryTextUsersControllerProvider provider,
  ) {
    return call(provider.queryText, provider.myGender);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name =>
      r'watchForwardMatchingWithQueryTextUsersControllerProvider';
}

/// See also [watchForwardMatchingWithQueryTextUsersController].
class WatchForwardMatchingWithQueryTextUsersControllerProvider
    extends AutoDisposeStreamProvider<List<UserData>> {
  /// See also [watchForwardMatchingWithQueryTextUsersController].
  WatchForwardMatchingWithQueryTextUsersControllerProvider(
    String queryText,
    int? myGender,
  ) : this._internal(
        (ref) => watchForwardMatchingWithQueryTextUsersController(
          ref as WatchForwardMatchingWithQueryTextUsersControllerRef,
          queryText,
          myGender,
        ),
        from: watchForwardMatchingWithQueryTextUsersControllerProvider,
        name: r'watchForwardMatchingWithQueryTextUsersControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$watchForwardMatchingWithQueryTextUsersControllerHash,
        dependencies:
            WatchForwardMatchingWithQueryTextUsersControllerFamily
                ._dependencies,
        allTransitiveDependencies:
            WatchForwardMatchingWithQueryTextUsersControllerFamily
                ._allTransitiveDependencies,
        queryText: queryText,
        myGender: myGender,
      );

  WatchForwardMatchingWithQueryTextUsersControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.queryText,
    required this.myGender,
  }) : super.internal();

  final String queryText;
  final int? myGender;

  @override
  Override overrideWith(
    Stream<List<UserData>> Function(
      WatchForwardMatchingWithQueryTextUsersControllerRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override:
          WatchForwardMatchingWithQueryTextUsersControllerProvider._internal(
            (ref) => create(
              ref as WatchForwardMatchingWithQueryTextUsersControllerRef,
            ),
            from: from,
            name: null,
            dependencies: null,
            allTransitiveDependencies: null,
            debugGetCreateSourceHash: null,
            queryText: queryText,
            myGender: myGender,
          ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<UserData>> createElement() {
    return _WatchForwardMatchingWithQueryTextUsersControllerProviderElement(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WatchForwardMatchingWithQueryTextUsersControllerProvider &&
        other.queryText == queryText &&
        other.myGender == myGender;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, queryText.hashCode);
    hash = _SystemHash.combine(hash, myGender.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchForwardMatchingWithQueryTextUsersControllerRef
    on AutoDisposeStreamProviderRef<List<UserData>> {
  /// The parameter `queryText` of this provider.
  String get queryText;

  /// The parameter `myGender` of this provider.
  int? get myGender;
}

class _WatchForwardMatchingWithQueryTextUsersControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<UserData>>
    with WatchForwardMatchingWithQueryTextUsersControllerRef {
  _WatchForwardMatchingWithQueryTextUsersControllerProviderElement(
    super.provider,
  );

  @override
  String get queryText =>
      (origin as WatchForwardMatchingWithQueryTextUsersControllerProvider)
          .queryText;
  @override
  int? get myGender =>
      (origin as WatchForwardMatchingWithQueryTextUsersControllerProvider)
          .myGender;
}

String _$userControllerHash() => r'3138e1fd93f8bcb77615baf5e598d44ec10a90ff';

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
String _$forwardMatchingWithQueryTextUsersLimitControllerHash() =>
    r'4c332f60b0b36a58bc5d4f99a0ab9c543a86d97f';

/// See also [ForwardMatchingWithQueryTextUsersLimitController].
@ProviderFor(ForwardMatchingWithQueryTextUsersLimitController)
final forwardMatchingWithQueryTextUsersLimitControllerProvider =
    AutoDisposeNotifierProvider<
      ForwardMatchingWithQueryTextUsersLimitController,
      int
    >.internal(
      ForwardMatchingWithQueryTextUsersLimitController.new,
      name: r'forwardMatchingWithQueryTextUsersLimitControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$forwardMatchingWithQueryTextUsersLimitControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ForwardMatchingWithQueryTextUsersLimitController =
    AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
