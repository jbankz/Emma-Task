import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/product_model.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState<T> with _$ProductState<T> {
  const factory ProductState(
      {@Default(false) bool isBusy,
      @Default([]) List<Product> products}) = _ProductState<T>;
}
