import 'package:dio/dio.dart';
import 'package:wat_mobile/ui/features/product/domain/model/product_model.dart';

import '../../domain/repository/product_repository.dart';
import '../../domain/service/product_service.dart';

class ProductServiceImpl implements ProductService {
  final ProductRepository _repository;

  ProductServiceImpl({required ProductRepository repository})
      : _repository = repository;

  @override
  Future<List<Product>> products({CancelToken? cancelToken}) async =>
      await _repository.products(cancelToken: cancelToken);
}
