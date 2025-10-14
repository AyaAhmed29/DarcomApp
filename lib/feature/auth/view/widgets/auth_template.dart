
import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/feature/auth/view/widgets/auth_prompt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTemplate extends StatelessWidget {
  const AuthTemplate({
    super.key,
    required this.form,
    required this.title,
    required this.subtitle,
    // required this.buttonText,
    required this.authPromptText,
    required this.authPromptButtonText, required this.authPromptOnPressed,
  });

  final Widget form;
  final String title;
  final String subtitle;
  // final String buttonText;
  final String authPromptText;
  final String authPromptButtonText;
  final void Function() authPromptOnPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(Assets.imagesAppIcon),
            ),
            SizedBox(height: 20.h),
            Text(
              title,

              style: AppStyles.bold19.copyWith(color: AppColors.orange800),
            ),
            SizedBox(height: 10.h),
            Text(
              subtitle,

              style: AppStyles.regular13.copyWith(color: AppColors.orange600),
            ),
            SizedBox(height: 30.h),
            Container(
              width: 330.w,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.inverseThemeColor(context),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  form,
                  AuthPrompt(
                    text: authPromptText,

                    textButton: authPromptButtonText,
                    onPressed: authPromptOnPressed,
                  
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
