import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/core/utils/app_route.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/feature/onboarding/presentation/view/Widget/custom_page.dart';
import 'package:darcom_app/feature/onboarding/presentation/view/Widget/custom_smooth_page_indicator.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: currentPage != 2 ? 1 : 0,
                child: TextButton(
                  onPressed: currentPage != 2
                      ? () {
                          GoRouter.of(context).go(AppRoute.signInView);
                        }
                      : null,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      S.of(context).skip,
                      style: AppStyles.semiBold16.copyWith(
                        color: AppColors.orange900,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 100.h),
              Expanded(
                child: PageView(
                  controller: controller,
                  children: [
                    CustomPage(
                      icon: Icons.chair,
                      image: Assets.imagesHeroFurniture,
                      text: S.of(context).loremTitle1,
                      descText: S.of(context).loremDescription1,
                    ),
                    CustomPage(
                      icon: Icons.attach_money,
                      image: Assets.imagesBedroomFurniture,
                      text: S.of(context).loremTitle2,
                      descText: S.of(context).loremDescription2,
                    ),
                    CustomPage(
                      icon: Icons.local_shipping,
                      image: Assets.imagesDiningFurniture,
                      text: S.of(context).loremTitle3,
                      descText: S.of(context).loremDescription3,
                    ),
                  ],
                ),
              ),
              CustomSmoothPageIndicator(
                currentPage: currentPage,
                controller: controller,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
