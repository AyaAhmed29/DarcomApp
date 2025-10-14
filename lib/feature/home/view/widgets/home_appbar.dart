
import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppPadding.horizontal18,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person),
                    ),
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: CircleAvatar(
                            backgroundColor: AppColors.red,
                            radius: 4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(Assets.imagesAppIcon),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
