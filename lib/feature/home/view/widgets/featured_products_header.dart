import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class FeaturedProductsHeader extends StatelessWidget {
  const FeaturedProductsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).FeaturedProducts,
            style: AppStyles.bold16,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              S.of(context).SeeAll,
              style: AppStyles.regular13,
            ),
          ),
        ],
      ),
    );
  }
}
