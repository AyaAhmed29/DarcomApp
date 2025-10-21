import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/widgets/custom_cach_image.dart';
import 'package:darcom_app/feature/home/data/model/slider_model.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final SliderModel sliderModel;

  const OfferCard({super.key, required this.sliderModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CustomCachImage(
              imageUrl: sliderModel.image,
              height: 180,
              width: double.infinity,
            ),
          ),
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.black.withValues(alpha: 0.5),
                  Colors.transparent,
                ],
              ),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sliderModel.title,

                  // "عروض الصيف",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  sliderModel.subtitle,

                  // "خصم يصل إلى 40%",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(S.of(context).shopNow),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
