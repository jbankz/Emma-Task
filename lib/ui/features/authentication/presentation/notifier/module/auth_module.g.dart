// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signupHash() => r'a22bb6f9dfc7b5d70ddf3bfc089e267d41f7347c';

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

/// See also [signup].
@ProviderFor(signup)
const signupProvider = SignupFamily();

/// See also [signup].
class SignupFamily extends Family<AsyncValue<User>> {
  /// See also [signup].
  const SignupFamily();

  /// See also [signup].
  SignupProvider call({
    required AuthDto authDto,
    CancelToken? cancelToken,
  }) {
    return SignupProvider(
      authDto: authDto,
      cancelToken: cancelToken,
    );
  }

  @override
  SignupProvider getProviderOverride(
    covariant SignupProvider provider,
  ) {
    return call(
      authDto: provider.authDto,
      cancelToken: provider.cancelToken,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'signupProvider';
}

/// See also [signup].
class SignupProvider extends AutoDisposeFutureProvider<User> {
  /// See also [signup].
  SignupProvider({
    required AuthDto authDto,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => signup(
            ref as SignupRef,
            authDto: authDto,
            cancelToken: cancelToken,
          ),
          from: signupProvider,
          name: r'signupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signupHash,
          dependencies: SignupFamily._dependencies,
          allTransitiveDependencies: SignupFamily._allTransitiveDependencies,
          authDto: authDto,
          cancelToken: cancelToken,
        );

  SignupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authDto,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto authDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<User> Function(SignupRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignupProvider._internal(
        (ref) => create(ref as SignupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authDto: authDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User> createElement() {
    return _SignupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignupProvider &&
        other.authDto == authDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SignupRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `authDto` of this provider.
  AuthDto get authDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _SignupProviderElement extends AutoDisposeFutureProviderElement<User>
    with SignupRef {
  _SignupProviderElement(super.provider);

  @override
  AuthDto get authDto => (origin as SignupProvider).authDto;
  @override
  CancelToken? get cancelToken => (origin as SignupProvider).cancelToken;
}

String _$signinHash() => r'95f01092e2041072e8ba8dff2ed5f44d47727852';

/// See also [signin].
@ProviderFor(signin)
const signinProvider = SigninFamily();

/// See also [signin].
class SigninFamily extends Family<AsyncValue<User>> {
  /// See also [signin].
  const SigninFamily();

  /// See also [signin].
  SigninProvider call({
    required AuthDto authDto,
    CancelToken? cancelToken,
  }) {
    return SigninProvider(
      authDto: authDto,
      cancelToken: cancelToken,
    );
  }

  @override
  SigninProvider getProviderOverride(
    covariant SigninProvider provider,
  ) {
    return call(
      authDto: provider.authDto,
      cancelToken: provider.cancelToken,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'signinProvider';
}

/// See also [signin].
class SigninProvider extends AutoDisposeFutureProvider<User> {
  /// See also [signin].
  SigninProvider({
    required AuthDto authDto,
    CancelToken? cancelToken,
  }) : this._internal(
          (ref) => signin(
            ref as SigninRef,
            authDto: authDto,
            cancelToken: cancelToken,
          ),
          from: signinProvider,
          name: r'signinProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signinHash,
          dependencies: SigninFamily._dependencies,
          allTransitiveDependencies: SigninFamily._allTransitiveDependencies,
          authDto: authDto,
          cancelToken: cancelToken,
        );

  SigninProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.authDto,
    required this.cancelToken,
  }) : super.internal();

  final AuthDto authDto;
  final CancelToken? cancelToken;

  @override
  Override overrideWith(
    FutureOr<User> Function(SigninRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SigninProvider._internal(
        (ref) => create(ref as SigninRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        authDto: authDto,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User> createElement() {
    return _SigninProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SigninProvider &&
        other.authDto == authDto &&
        other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, authDto.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SigninRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `authDto` of this provider.
  AuthDto get authDto;

  /// The parameter `cancelToken` of this provider.
  CancelToken? get cancelToken;
}

class _SigninProviderElement extends AutoDisposeFutureProviderElement<User>
    with SigninRef {
  _SigninProviderElement(super.provider);

  @override
  AuthDto get authDto => (origin as SigninProvider).authDto;
  @override
  CancelToken? get cancelToken => (origin as SigninProvider).cancelToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
