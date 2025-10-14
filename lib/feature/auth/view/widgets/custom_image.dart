import 'package:darcom_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, this.image});
  final ImageProvider? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18.h),
      height: 298.h,
      width: 375.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image ?? AssetImage(Assets.imagesAppIcon),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
