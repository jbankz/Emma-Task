import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wat_mobile/ui/features/product/domain/model/product_model.dart';

import '../../../domain/usecase/module/module.dart';

part 'product_module.g.dart';

@riverpod
Future<List<Product>> products(ProductsRef ref,
        {CancelToken? cancelToken}) async =>
    await ref.read(productUseCaseModule).execute(cancelToken);
