import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wat_mobile/app/core/router/page_router.dart';
import 'package:wat_mobile/app/stack/app.router.dart';
import 'package:wat_mobile/ui/common/app_colors.dart';
import 'package:wat_mobile/ui/features/product/presentation/notifier/product_notifier.dart';
import 'package:wat_mobile/ui/widget/body_widget.dart';
import 'package:wat_mobile/ui/widget/edit_field_widget.dart';
import 'package:wat_mobile/ui/widget/gap.dart';
import 'package:wat_mobile/utils/extensions.dart';

import '../../domain/model/product_model.dart';

class ProductListView extends ConsumerStatefulWidget {
  const ProductListView({super.key});

  @override
  ConsumerState<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends ConsumerState<ProductListView> {
  @override
  void initState() {
    super.initState();
    _initializeProvider();
  }

  Future<void> _initializeProvider() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref
          .read(productNotifierProvider.notifier)
          .getProduct(CancelToken());
    });
  }

  Widget buildSearchField() => const EditFormField(
        label: 'Search...',
        filledColor: AppColors.white,
        suffixWidget: Icon(Icons.search),
      );

  Widget buildProductItem(BuildContext context, Product product) => InkWell(
        onTap: () => PageRouter.pushNamed(
          Routes.productDetailView,
          args: ProductDetailViewArguments(product: product),
        ),
        child: Hero(
          tag: product.name ?? '',
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(imageUrl: product.image ?? ''),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.60),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(8.r)),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  child: Material(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                product.name ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Gap(height: 2),
                              Text(
                                '${product.reviews.length} Reviews',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        const Gap(width: 10),
                        Text(
                          product.price.toNaira,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productNotifierProvider);

    return BodyWidget(
      showAppBar: true,
      appBarTitle: 'Products',
      child: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            const Gap(height: 16),
            buildSearchField(),
            const Gap(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: productState.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = productState.products[index];
                  return buildProductItem(context, product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
