import 'package:dio/dio.dart';

import '../model/product_model.dart';

abstract class ProductService {
  Future<List<Product>> products({CancelToken? cancelToken});
}
