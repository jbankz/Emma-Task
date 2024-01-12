import 'package:dio/dio.dart';

import '../model/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> products({CancelToken? cancelToken});
}
