// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState<T> {
  bool get isBusy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<T, AuthState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<T, $Res> {
  factory $AuthStateCopyWith(
          AuthState<T> value, $Res Function(AuthState<T>) then) =
      _$AuthStateCopyWithImpl<T, $Res, AuthState<T>>;
  @useResult
  $Res call({bool isBusy});
}

/// @nodoc
class _$AuthStateCopyWithImpl<T, $Res, $Val extends AuthState<T>>
    implements $AuthStateCopyWith<T, $Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<T, $Res>
    implements $AuthStateCopyWith<T, $Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl<T> value, $Res Function(_$AuthStateImpl<T>) then) =
      __$$AuthStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool isBusy});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthStateImpl<T>>
    implements _$$AuthStateImplCopyWith<T, $Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl<T> _value, $Res Function(_$AuthStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
  }) {
    return _then(_$AuthStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl<T> implements _AuthState<T> {
  const _$AuthStateImpl({this.isBusy = false});

  @override
  @JsonKey()
  final bool isBusy;

  @override
  String toString() {
    return 'AuthState<$T>(isBusy: $isBusy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isBusy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<T, _$AuthStateImpl<T>> get copyWith =>
      __$$AuthStateImplCopyWithImpl<T, _$AuthStateImpl<T>>(this, _$identity);
}

abstract class _AuthState<T> implements AuthState<T> {
  const factory _AuthState({final bool isBusy}) = _$AuthStateImpl<T>;

  @override
  bool get isBusy;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<T, _$AuthStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
