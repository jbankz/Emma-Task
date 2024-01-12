// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      specification: json['specification'] as String?,
      price: json['price'] as num? ?? 0,
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => Reviews.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'specification': instance.specification,
      'price': instance.price,
      'reviews': instance.reviews,
    };

_$ReviewsImpl _$$ReviewsImplFromJson(Map<String, dynamic> json) =>
    _$ReviewsImpl(
      name: json['name'] as String?,
      image: json['image'] as String?,
      message: json['message'] as String?,
      rating: json['rating'] as num? ?? 0,
    );

Map<String, dynamic> _$$ReviewsImplToJson(_$ReviewsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'message': instance.message,
      'rating': instance.rating,
    };
