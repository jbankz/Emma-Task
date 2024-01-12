import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wat_mobile/ui/features/product/data/source/module/module.dart';

import '../../../domain/repository/product_repository.dart';
import '../product_repository_impl.dart';

final productRepoModule = Provider<ProductRepository>(
    (ref) => ProductRepositoryImpl(source: ref.read(productSourceModule)));
