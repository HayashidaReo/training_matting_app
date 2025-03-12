// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talk_history_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$talkHistoryRepoHash() => r'fb0579a68f5d2054a8080dc5a33d7659bb2d2072';

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

abstract class _$TalkHistoryRepo
    extends BuildlessAutoDisposeNotifier<CollectionReference<TalkHistory>> {
  late final String talkRoomId;

  CollectionReference<TalkHistory> build(String talkRoomId);
}

/// See also [TalkHistoryRepo].
@ProviderFor(TalkHistoryRepo)
const talkHistoryRepoProvider = TalkHistoryRepoFamily();

/// See also [TalkHistoryRepo].
class TalkHistoryRepoFamily extends Family<CollectionReference<TalkHistory>> {
  /// See also [TalkHistoryRepo].
  const TalkHistoryRepoFamily();

  /// See also [TalkHistoryRepo].
  TalkHistoryRepoProvider call(String talkRoomId) {
    return TalkHistoryRepoProvider(talkRoomId);
  }

  @override
  TalkHistoryRepoProvider getProviderOverride(
    covariant TalkHistoryRepoProvider provider,
  ) {
    return call(provider.talkRoomId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'talkHistoryRepoProvider';
}

/// See also [TalkHistoryRepo].
class TalkHistoryRepoProvider
    extends
        AutoDisposeNotifierProviderImpl<
          TalkHistoryRepo,
          CollectionReference<TalkHistory>
        > {
  /// See also [TalkHistoryRepo].
  TalkHistoryRepoProvider(String talkRoomId)
    : this._internal(
        () => TalkHistoryRepo()..talkRoomId = talkRoomId,
        from: talkHistoryRepoProvider,
        name: r'talkHistoryRepoProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$talkHistoryRepoHash,
        dependencies: TalkHistoryRepoFamily._dependencies,
        allTransitiveDependencies:
            TalkHistoryRepoFamily._allTransitiveDependencies,
        talkRoomId: talkRoomId,
      );

  TalkHistoryRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.talkRoomId,
  }) : super.internal();

  final String talkRoomId;

  @override
  CollectionReference<TalkHistory> runNotifierBuild(
    covariant TalkHistoryRepo notifier,
  ) {
    return notifier.build(talkRoomId);
  }

  @override
  Override overrideWith(TalkHistoryRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: TalkHistoryRepoProvider._internal(
        () => create()..talkRoomId = talkRoomId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        talkRoomId: talkRoomId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    TalkHistoryRepo,
    CollectionReference<TalkHistory>
  >
  createElement() {
    return _TalkHistoryRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TalkHistoryRepoProvider && other.talkRoomId == talkRoomId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, talkRoomId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TalkHistoryRepoRef
    on AutoDisposeNotifierProviderRef<CollectionReference<TalkHistory>> {
  /// The parameter `talkRoomId` of this provider.
  String get talkRoomId;
}

class _TalkHistoryRepoProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          TalkHistoryRepo,
          CollectionReference<TalkHistory>
        >
    with TalkHistoryRepoRef {
  _TalkHistoryRepoProviderElement(super.provider);

  @override
  String get talkRoomId => (origin as TalkHistoryRepoProvider).talkRoomId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
