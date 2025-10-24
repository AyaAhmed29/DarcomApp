import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class ProdectGridShimmer extends StatelessWidget {
  const ProdectGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal18,
      child: MasonryGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProdectShimmerItem();
        },
      ),
    );
  }
}

class ProdectShimmerItem extends StatelessWidget {
  const ProdectShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.withValues(alpha: .4),
      highlightColor: AppColors.grey.withValues(alpha: .1),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //prodectName
                  Container(
                    height: 14,
                    width: 100,

                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Descraption
                  Container(
                    height: 12,
                    width: 140,

                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // price
                  Container(
                    height: 14,
                    width: 60,

                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // rating
                  Row(
                    children: List.generate(
                      5,
                      (starIndex) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
