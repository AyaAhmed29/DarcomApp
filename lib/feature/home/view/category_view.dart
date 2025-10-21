import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/core/widgets/custom_appbar.dart';
import 'package:darcom_app/feature/home/data/model/category_model.dart';
import 'package:darcom_app/feature/home/view/widgets/filters_widget.dart';
import 'package:darcom_app/feature/home/view/widgets/products_grid_view.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra;
    final category = extra != null ? extra as CategoryModel : null;

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
                '${S.of(context).Result}  ${category?.products.length} ${S.of(context).items}',
                style: AppStyles.regular13.copyWith(color: Colors.grey[600]),
              ),
            ),

            ProductsGridView(products: category!.products),
          ],
        ),
      ),
    );
  }
}
