import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/feature/home/data/model/product_model.dart';
import 'package:flutter/widgets.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        Text(
          product.discount == 0
              ? "${product.price}\$"
              : "${(product.price * (1 - product.discount / 100)).toStringAsFixed(2)}\$",
          style: AppStyles.semiBold18.copyWith(color: AppColors.orange600),
        ),
        Text(
          "${product.price}\$",
          style: AppStyles.semiBold16.copyWith(
            decoration: TextDecoration.lineThrough,

            color: AppColors.gray400,
          ),
        ),
      ],
    );
  }
}
