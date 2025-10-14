import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/core/widgets/custom_appbar.dart';
import 'package:darcom_app/feature/home/view/widgets/filters_widget.dart';
import 'package:darcom_app/feature/home/view/widgets/products_grid_view.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  String sortBy = 'popular';

  final List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'name': 'كنبة عصرية فاخرة',
      'price': '12,500 جنيه',
      'image': Assets.imagesDiningFurniture,
      'rating': 4.8,
      'discount': 'خصم 20%',
      'originalPrice': '15,625 جنيه',
    },
    {
      'id': 2,
      'name': 'طقم غرفة نوم كامل',
      'price': Assets.imagesAppIcon,
      'image': 'assets/images/bedroom_furniture.jpg',
      'rating': 4.9,
    },
    {
      'id': 3,
      'name': 'طاولة طعام خشبية',
      'price': '8,500 جنيه',
      'image': Assets.imagesGetStart,
      'rating': 4.7,
      'discount': 'عرض خاص',
    },
    {
      'id': 4,
      'name': 'طقم صالون فخم',
      'price': '18,000 جنيه',
      'image': Assets.imagesDiningFurniture,
      'rating': 5.0,
    },
    {
      'id': 5,
      'name': 'كنبة مودرن راقية',
      'price': '15,000 جنيه',
      'image': Assets.imagesDiningFurniture,
      'rating': 4.6,
    },
    {
      'id': 6,
      'name': 'سرير خشب زان',
      'price': '20,000 جنيه',
      'image': Assets.imagesDiningFurniture,
      'rating': 4.9,
      'discount': 'خصم 15%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Category Name'),
      body: SingleChildScrollView(
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filters
            FiltersWidget(),

            // Results count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${S.of(context).Result}  ${products.length} ${S.of(context).items}',
                style: AppStyles.regular13.copyWith(color: Colors.grey[600]),
              ),
            ),

            ProductsGridView(products: products),
          ],
        ),
      ),
    );
  }
}
