
import 'package:darcom_app/core/utils/app_colors.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key, required this.discount});

  final int discount;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.orange400,

            borderRadius: BorderRadius.only(topRight: Radius.circular(20.r)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 16),
            child: (discount) != 0
                ? Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "$discount % ",
                          style: AppStyles.bold16.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                        TextSpan(
                          text: "OFF",
                          style: AppStyles.bold13.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
