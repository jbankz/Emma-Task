import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wat_mobile/app/stack/app.logger.dart';
import 'package:wat_mobile/ui/features/product/domain/model/product_model.dart';
import 'package:wat_mobile/ui/features/product/presentation/notifier/module/product_module.dart';
import 'package:wat_mobile/ui/features/product/presentation/state/product_state.dart';

part 'product_notifier.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  final logger = getLogger('ProductNotifier');

  List<Product> _product = [];

  @override
  ProductState build() => const ProductState();

  Future<void> getProduct([CancelToken? cancelToken]) async {
    try {
      state = state.copyWith(isBusy: true);
      _product = await ref
          .read(productsProvider.call(cancelToken: cancelToken).future);
    } catch (e) {
      logger.e(e.toString());
    } finally {
      state = state.copyWith(isBusy: false, products: _product);
    }
  }
}
