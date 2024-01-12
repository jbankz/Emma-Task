import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wat_mobile/ui/common/app_colors.dart';
import 'package:wat_mobile/ui/features/product/domain/model/product_model.dart';
import 'package:wat_mobile/ui/widget/gap.dart';
import 'package:wat_mobile/utils/extensions.dart';
import 'package:wat_mobile/utils/triggery_notification_tray.dart';

import '../../../../widget/body_widget.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) => BodyWidget(
        showAppBar: true,
        showLeadingWidget: true,
        backgroundColor: AppColors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.darkScaffold,
          child: Icon(_isLiked ? Icons.favorite : Icons.favorite_outline),
          onPressed: () async {
            setState(() => _isLiked = !_isLiked);
            triggerNotification(
              _isLiked
                  ? 'You have added this product to favourites'
                  : 'You have removed this product from favourite',
            );
          },
        ),
        child: ListView(
          children: [
            buildProductImage(),
            const Gap(height: 16),
            buildProductInfo(),
            const Gap(height: 8),
            const Divider(thickness: 1),
            const Gap(height: 8),
            buildSectionTitle('Description'),
            const Gap(height: 8),
            buildText(widget.product.description ?? ''),
            const Gap(height: 8),
            const Divider(thickness: 1),
            const Gap(height: 8),
            buildSectionTitle('Specification'),
            const Gap(height: 8),
            buildText(widget.product.specification ?? ''),
            const Gap(height: 8),
            const Divider(thickness: 1),
            const Gap(height: 8),
            buildSectionTitle('Users Reviews'),
            const Gap(height: 8),
            buildUserReviews(),
          ],
        ),
      );

  Widget buildProductImage() => Hero(
        tag: widget.product.name ?? '',
        child: CachedNetworkImage(
          width: double.infinity,
          height: 250.h,
          imageUrl: widget.product.image ?? '',
        ),
      );

  Widget buildProductInfo() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProductTitle(),
            const Gap(height: 16),
            buildProductPrice(),
            const Gap(height: 8),
            buildReviewsInfo(),
          ],
        ),
      );

  Widget buildProductTitle() => Text(
        widget.product.name ?? '',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
        ),
        textAlign: TextAlign.left,
      );

  Widget buildProductPrice() => Text(
        widget.product.price.toNaira,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
        ),
        textAlign: TextAlign.left,
      );

  Widget buildReviewsInfo() => Column(
        children: [
          Text(
            '${widget.product.reviews.length} Reviews',
            style: TextStyle(
              color: Colors.black.withOpacity(.50),
              fontWeight: FontWeight.w500,
              fontSize: 10.sp,
            ),
            textAlign: TextAlign.left,
          ),
          const Gap(height: 8),
        ],
      );

  Widget buildSectionTitle(String title) => Text(
        title,
        style: TextStyle(
          color: Colors.black.withOpacity(.50),
          fontWeight: FontWeight.w500,
          fontSize: 10.sp,
        ),
        textAlign: TextAlign.left,
      );

  Widget buildText(String text) => Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          height: 1.3,
        ),
        textAlign: TextAlign.left,
      );

  Widget buildUserReviews() => Column(
        children: List.generate(
          widget.product.reviews.length,
          (index) => Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(widget.product.reviews[index].name ?? ''),
                const Gap(height: 5),
                buildText(widget.product.reviews[index].message ?? ''),
              ],
            ),
          ),
        ),
      );
}
