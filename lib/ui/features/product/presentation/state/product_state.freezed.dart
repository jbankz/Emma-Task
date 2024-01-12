// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductState<T> {
  bool get isBusy => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductStateCopyWith<T, ProductState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<T, $Res> {
  factory $ProductStateCopyWith(
          ProductState<T> value, $Res Function(ProductState<T>) then) =
      _$ProductStateCopyWithImpl<T, $Res, ProductState<T>>;
  @useResult
  $Res call({bool isBusy, List<Product> products});
}

/// @nodoc
class _$ProductStateCopyWithImpl<T, $Res, $Val extends ProductState<T>>
    implements $ProductStateCopyWith<T, $Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStateImplCopyWith<T, $Res>
    implements $ProductStateCopyWith<T, $Res> {
  factory _$$ProductStateImplCopyWith(_$ProductStateImpl<T> value,
          $Res Function(_$ProductStateImpl<T>) then) =
      __$$ProductStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool isBusy, List<Product> products});
}

/// @nodoc
class __$$ProductStateImplCopyWithImpl<T, $Res>
    extends _$ProductStateCopyWithImpl<T, $Res, _$ProductStateImpl<T>>
    implements _$$ProductStateImplCopyWith<T, $Res> {
  __$$ProductStateImplCopyWithImpl(
      _$ProductStateImpl<T> _value, $Res Function(_$ProductStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? products = null,
  }) {
    return _then(_$ProductStateImpl<T>(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$ProductStateImpl<T> implements _ProductState<T> {
  const _$ProductStateImpl(
      {this.isBusy = false, final List<Product> products = const []})
      : _products = products;

  @override
  @JsonKey()
  final bool isBusy;
  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductState<$T>(isBusy: $isBusy, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStateImpl<T> &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isBusy, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStateImplCopyWith<T, _$ProductStateImpl<T>> get copyWith =>
      __$$ProductStateImplCopyWithImpl<T, _$ProductStateImpl<T>>(
          this, _$identity);
}

abstract class _ProductState<T> implements ProductState<T> {
  const factory _ProductState(
      {final bool isBusy,
      final List<Product> products}) = _$ProductStateImpl<T>;

  @override
  bool get isBusy;
  @override
  List<Product> get products;
  @override
  @JsonKey(ignore: true)
  _$$ProductStateImplCopyWith<T, _$ProductStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
