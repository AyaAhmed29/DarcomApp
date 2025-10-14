import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.ontap});
  final String text;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextButton(
        onPressed: ontap,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.orange800,

                AppColors.orange700,
                AppColors.orange500,
              ],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: Text(
              text,
              style: TextStyle(color: AppColors.inverseThemeColor(context)),
            ),
          ),
        ),
      ),
    );
  }
}
