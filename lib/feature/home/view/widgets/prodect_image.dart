import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:darcom_app/feature/home/data/model/product_model.dart';
import 'package:darcom_app/feature/home/view/widgets/discount_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProdectImage extends StatelessWidget {
  const ProdectImage({super.key, this.product});
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Theme.of(context).colorScheme.surface,
        ),
        width: 306.w,
        height: 308.h,
        child: Stack(
          children: [
            SizedBox.expand(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  product?.image ??
                      'https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d?w=1200&q=80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: AppPadding.all16,
                child: IconButton(
                  icon: (product?.isVaforat ?? false)
                      ? Image.asset(Assets.imagesIconsWhiteHard)
                      : Image.asset(Assets.imagesIconsRedHard),
                  onPressed: () {
                    if (product?.isVaforat == false && product?.id != null) {
                      // FeaturCubit.get(context).addFavorite(product!.id!);
                    }
                  },
                ),
              ),
            ),

            DiscountWidget(discount: product!.discount),
          ],
        ),
      ),
    );
  }
}
