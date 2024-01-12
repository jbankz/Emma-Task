import 'package:dio/dio.dart';

import '../../domain/model/product_model.dart';

abstract class ProductSource {
  Future<List<Product>> product({CancelToken? cancelToken});
}
