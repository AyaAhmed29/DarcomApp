import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'package:darcom_app/core/utils/app_colors.dart';

class CustomCachImage extends StatelessWidget {
  const CustomCachImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.width,
  });
  final String imageUrl;
  final double? height;
  final double? width;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        height: height,
        width: width ?? 130.w,
        imageUrl: imageUrl,

        fit: BoxFit.cover,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: AppColors.orange700.withValues(alpha: 0.3),
          highlightColor: AppColors.orange700.withValues(alpha: 0.1),
          child: Container(height: 165.h, width: 168.w, color: Colors.white),
        ),

        errorWidget: (context, url, error) => Container(
          color: AppColors.orange700.withValues(alpha: 0.3),
          child: Icon(Icons.error, size: 40),
        ),
      ),
    );
  }
}
