import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AuthPrompt extends StatelessWidget {
  const AuthPrompt({
    super.key,
    required this.text,
    required this.textButton,
    this.onPressed,
  });
  final String text;
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppStyles.regular11),
        SizedBox(width: 5.w),
        TextButton(
          onPressed:
              onPressed ??
              () {
                GoRouter.of(context).pop();
              },
          child: Text(
            textButton,
            style: AppStyles.regular11.copyWith(
              // color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
