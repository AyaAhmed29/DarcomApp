import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({
    super.key,
    required this.image,
    required this.text,
    required this.descText,
    required this.icon,
  });

  final String image;
  final String text;
  final String descText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400.h,
          width: 320.w,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.gray50.withValues(alpha: 0.2),
                      AppColors.gray50.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10.h,
                right: 10.w,
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: AppColors.orange400,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.inverseThemeColor(context),
                    size: 30.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: AppStyles.bold23,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            descText,
            style: AppStyles.regular16.copyWith(color: AppColors.gray300),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
