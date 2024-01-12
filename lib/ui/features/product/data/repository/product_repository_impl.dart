import 'package:dio/dio.dart';
import 'package:wat_mobile/ui/features/product/domain/model/product_model.dart';

import '../../domain/repository/product_repository.dart';
import '../source/product_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductSource _source;

  ProductRepositoryImpl({required ProductSource source}) : _source = source;

  @override
  Future<List<Product>> products({CancelToken? cancelToken}) async =>
      await _source.product(cancelToken: cancelToken);
}
