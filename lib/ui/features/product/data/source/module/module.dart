import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../app/core/network/module/module.dart';
import '../product_source.dart';
import '../product_source_impl.dart';

final productSourceModule = Provider<ProductSource>(
    (ref) => ProductSourceImpl(dioClient: ref.read(dioClientProvider)));
