import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/core/widgets/custom_button.dart';
import 'package:darcom_app/feature/home/data/model/product_model.dart';
import 'package:darcom_app/feature/home/view/widgets/price_section.dart';
import 'package:darcom_app/feature/home/view/widgets/product_card.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Padding(
          padding: AppPadding.all24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(product.name, style: AppStyles.bold23),
              SizedBox(height: 15.h),
              Text(product.description, style: AppStyles.regular16),
              SizedBox(height: 20.h),
              PriceSection(product: product),
              RateWidget(product: product),
              SizedBox(height: 50.h),
              CustomButton(ontap: () async {}, text: S.of(context).addToCart),
            ],
          ),
        );
      },
    );
  }
}
