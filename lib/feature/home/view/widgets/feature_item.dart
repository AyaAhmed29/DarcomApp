import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:darcom_app/core/utils/app_route.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/core/widgets/custom_cach_image.dart';
import 'package:darcom_app/feature/home/data/model/category_model.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key, required this.categories});
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPadding.horizontal18,
          child: Text(S.of(context).allFeatured, style: AppStyles.semiBold16),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {
                  GoRouter.of(
                    context,
                  ).push(AppRoute.categoryView, extra: category);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCachImage(
                        imageUrl: category.imageUrl,
                        height: 50,
                        width: 50,
                      ),

                      const SizedBox(height: 6),
                      Text(category.name, style: const TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
