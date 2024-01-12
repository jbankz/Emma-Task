import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  factory Product(
      {String? name,
      String? image,
      String? description,
      String? specification,
      @Default(0) num price,
      @Default([]) List<Reviews> reviews}) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class Reviews with _$Reviews {
  factory Reviews(
      {String? name,
      String? image,
      String? message,
      @Default(0) num rating}) = _Reviews;

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);
}
