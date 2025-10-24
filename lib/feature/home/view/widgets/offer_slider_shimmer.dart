import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:darcom_app/core/utils/app_colors.dart';

class OfferSliderShimmer extends StatelessWidget {
  OfferSliderShimmer({super.key});

  final PageController controller = PageController();

  void startAutoSlide() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (controller.hasClients) {
        int nextPage = controller.page!.round() + 1;
        if (nextPage >= 3) nextPage = 0;
        controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    startAutoSlide();

    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: controller,
        itemCount: 3,
        itemBuilder: (context, index) => const OfferCardShimmer(),
      ),
    );
  }
}

class OfferCardShimmer extends StatelessWidget {
  const OfferCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        children: [
          SizedBox.expand(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 180,
                width: double.infinity,
                color: AppColors.grey.withValues(alpha: .3),
              ),
            ),
          ),

          Container(
            height: 180,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Shimmer.fromColors(
              baseColor: AppColors.grey.withValues(alpha: .4),
              highlightColor: AppColors.grey.withValues(alpha: .1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 20,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 160,
                    height: 14,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 100,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,

                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
