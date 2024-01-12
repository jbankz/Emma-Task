import 'package:riverpod/riverpod.dart';

import '../../../../../../app/core/usecase/app_usecase.dart';
import '../../../data/service/module/module.dart';
import '../product_usecase.dart';

final productUseCaseModule = Provider<WatUseCaseWithOutParam>((ref) =>
    ProductUseCaseImpl(productService: ref.read(productServiceModule)));
