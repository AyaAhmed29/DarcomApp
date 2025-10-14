import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_route.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.currentPage,
    required this.controller,
  });

  final int currentPage;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentPage > 0,
          child: TextButton(
            onPressed: () {
              controller.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              S.of(context).prev,

              style: AppStyles.semiBold16.copyWith(color: AppColors.orange400),
            ),
          ),
        ),

        SmoothPageIndicator(
          count: 3,
          controller: controller,
          effect: SwapEffect(
            dotHeight: 15,
            dotWidth: 15,
            activeDotColor: AppColors.orange400,
            spacing: 10,
            dotColor: AppColors.gray200,
          ),
        ),

        currentPage == 2
            ? TextButton(
                onPressed: () {
                  GoRouter.of(context).go(AppRoute.signInView);
                },
                child: Text(
                  S.of(context).getStarted,

                  style: AppStyles.semiBold16.copyWith(
                    color: AppColors.orange400,
                  ),
                ),
              )
            : TextButton(
                onPressed: () {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  S.of(context).prev,

                  style: AppStyles.semiBold16.copyWith(
                    color: AppColors.orange400,
                  ),
                ),
              ),
      ],
    );
  }
}
