import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_route.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/core/widgets/custom_cach_image.dart';
import 'package:darcom_app/feature/home/data/model/product_model.dart';
import 'package:darcom_app/feature/home/view/widgets/discount_widget.dart';
import 'package:darcom_app/feature/home/view/widgets/price_section.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoute.productView, extra: product);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.inverseThemeColor(context).withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray500.withValues(alpha: 0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      // Image.network(
                      //   product.image,
                      //   width: double.infinity,
                      //   fit: BoxFit.fitWidth,
                      // ),
                      CustomCachImage(
                        imageUrl: product.image,
                        width: double.infinity,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r),
                        ),
                        // fit: BoxFit.fitWidth,
                      ),
                      DiscountWidget(discount: product.discount),
                    ],
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: AppColors.inverseThemeColor(
                      context,
                    ).withValues(alpha: 0.7),
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
                        // Handle favorite action
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        // color: AppColors.orange900,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.bold16,
                  ),
                  PriceSection(product: product),
                  RateWidget(product: product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RateWidget extends StatelessWidget {
  const RateWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          //rating
          rating: product.rate,
          itemCount: 5,
          itemSize: 14,
          itemBuilder: (context, _) =>
              Icon(Icons.star, color: AppColors.orange500),
        ),
        SizedBox(width: 3.w),

        Text("(${product.rate}) ", style: AppStyles.regular13),
        Text(
          "${product.rateCount.toString()} ${S.of(context).Rate}",
          style: AppStyles.regular13,
        ),
      ],
    );
  }
}
