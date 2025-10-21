
import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllFeatureShimmer extends StatelessWidget {
  const AllFeatureShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPadding.horizontal18,
          child: Shimmer.fromColors(
            baseColor: AppColors.grey.withValues(alpha: 0.4),
            highlightColor: AppColors.grey.withValues(alpha: 0.1),
            child: Container(
              height: 20,
              width: 120,
              color: Colors.grey.shade300,
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 9,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Shimmer.fromColors(
                      baseColor: AppColors.grey.withValues(alpha: 0.4),
                      highlightColor: AppColors.grey.withValues(alpha: 0.1),
                      child: CircleAvatar(
                        radius: 25, // نفس حجم CustomCachImage
                        backgroundColor: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Shimmer.fromColors(
                      baseColor: AppColors.grey.withValues(alpha: 0.4),
                      highlightColor: AppColors.grey.withValues(alpha: 0.1),
                      child: Container(
                        height: 10,
                        width: 50, // تقريبًا نفس حجم النص
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
