import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Image.asset(
                  product["image"] ?? Assets.imagesHeroFurniture,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
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
                  product["name"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product["price"],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      //rating
                      rating: product["rating"],
                      itemCount: 5,
                      itemSize: 14, 
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: AppColors.orange500),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      product["rating"].toString(),
                      style: AppStyles.regular13,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
