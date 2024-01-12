import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wat_mobile/app/core/network/http_client.dart';

import '../../domain/model/product_model.dart';
import 'product_source.dart';

class ProductSourceImpl implements ProductSource {
  // ignore: unused_field
  final DioClient _dioClient;

  ProductSourceImpl({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<List<Product>> product({CancelToken? cancelToken}) async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/json/products.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => Product.fromJson(e)).toList();
    } catch (e) {
      // Handle exceptions, log or rethrow as needed
      debugPrint('Error loading products: $e');
      rethrow;
    }
  }
}
