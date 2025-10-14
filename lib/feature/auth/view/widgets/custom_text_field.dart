import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.icon,
    this.suffixIcon,
    required this.keyboardType,
    this.suffixIconOnPressed,
    this.isPasswordVisible,

    this.validator,
    this.controller,
    this.obscureText,
  });
  final TextEditingController? controller;
  final String text;
  final String? icon;
  final String? suffixIcon;
  final TextInputType keyboardType;
  final void Function()? suffixIconOnPressed;
  final bool? isPasswordVisible;
  final String? Function(String?)? validator;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal16vertical8,
      child: TextFormField(
        controller: controller,
        validator: validator,

        cursorColor: AppColors.orange700,
        cursorErrorColor: AppColors.red,
        obscureText: obscureText ?? false,
        obscuringCharacter: '*',
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixIconOnPressed,
                  icon: SvgPicture.asset(
                    suffixIcon!,
                    colorFilter: ColorFilter.mode(
                      AppColors.orange700,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : null,
          prefixIcon: icon != null
              ? IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    icon!,
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      AppColors.orange700,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : null,
          labelText: text,
          labelStyle: AppStyles.regular13,
          border: _borderStyle(),
          focusedBorder: _borderStyle().copyWith(
            borderSide: BorderSide(color: AppColors.orange700),
          ),
          errorBorder: _borderStyle().copyWith(
            borderSide: BorderSide(color: AppColors.red),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(color: AppColors.gray100),
    );
  }
}
