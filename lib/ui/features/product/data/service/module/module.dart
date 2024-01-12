import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wat_mobile/ui/features/product/data/service/product_service_impl.dart';
import 'package:wat_mobile/ui/features/product/domain/service/product_service.dart';

import '../../repository/module/module.dart';

final productServiceModule = Provider<ProductService>(
    (ref) => ProductServiceImpl(repository: ref.read(productRepoModule)));
