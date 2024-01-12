import 'package:dio/dio.dart';
import 'package:wat_mobile/ui/features/product/domain/model/product_model.dart';
import 'package:wat_mobile/ui/features/product/domain/service/product_service.dart';

import '../../../../../app/core/usecase/app_usecase.dart';

class ProductUseCaseImpl extends WatUseCaseWithOutParam<Future<List<Product>>> {
  final ProductService _productService;

  ProductUseCaseImpl({required ProductService productService})
      : _productService = productService;

  @override
  Future<List<Product>> execute([CancelToken? cancelToken]) async =>
      await _productService.products(cancelToken: cancelToken);
}
