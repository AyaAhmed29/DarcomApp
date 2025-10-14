import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/core/utils/app_route.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/feature/home/view/widgets/OfferSlider.dart';
import 'package:darcom_app/feature/home/view/widgets/feature_item.dart';
import 'package:darcom_app/feature/home/view/widgets/products_grid_view.dart';
import 'package:darcom_app/feature/home/view/widgets/home_appbar.dart';
import 'package:darcom_app/feature/home/view/widgets/search_widget.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"id": 1, "name": "غرف نوم", "icon": Icons.bed, "count": 45},
    {"id": 2, "name": "غرف معيشة", "icon": Icons.chair, "count": 62},
    {"id": 3, "name": "غرف طعام", "icon": Icons.dining, "count": 38},
    {"id": 4, "name": "مكاتب", "icon": Icons.home, "count": 28},
    {"id": 1, "name": "غرف نوم", "icon": Icons.bed, "count": 45},
    {"id": 2, "name": "غرف معيشة", "icon": Icons.chair, "count": 62},
    {"id": 3, "name": "غرف طعام", "icon": Icons.dining, "count": 38},
    {"id": 4, "name": "مكاتب", "icon": Icons.home, "count": 28},
  ];

  final List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "name": "كنبة عصرية فاخرة",
      "price": "12,500 جنيه",
      "image": Assets.imagesDiningFurniture,
      "rating": 4.8,
      "discount": "خصم 20%",
      "originalPrice": "15,625 جنيه",
    },
    {
      "id": 1,
      "name": "كنبة عصرية فاخرة",
      "price": "12,500 جنيه",
      "image": Assets.imagesAppIcon,
      "rating": 4.8,
      "discount": "خصم 20%",
      "originalPrice": "15,625 جنيه",
    },
    {
      "id": 2,
      "name": "طقم غرفة نوم كامل",
      "price": "25,000 جنيه",
      "image": Assets.imagesBedroomFurniture,
      "rating": 4.9,
    },
    {
      "id": 3,
      "name": "طاولة طعام خشبية",
      "price": "8,500 جنيه",
      "image": Assets.imagesDiningFurniture,
      "rating": 4.7,
      "discount": "عرض خاص",
    },
    {
      "id": 4,
      "name": "طقم صالون فخم",
      "price": "18,000 جنيه",
      "image": Assets.imagesHeroFurniture,
      "rating": 5.0,
    },
    {
      "id": 1,
      "name": "كنبة عصرية فاخرة",
      "price": "12,500 جنيه",
      "image": Assets.imagesDiningFurniture,
      "rating": 4.8,
      "discount": "خصم 20%",
      "originalPrice": "15,625 جنيه",
    },
    {
      "id": 1,
      "name": "كنبة عصرية فاخرة",
      "price": "12,500 جنيه",
      "image": Assets.imagesAppIcon,
      "rating": 4.8,
      "discount": "خصم 20%",
      "originalPrice": "15,625 جنيه",
    },
    {
      "id": 2,
      "name": "طقم غرفة نوم كامل",
      "price": "25,000 جنيه",
      "image": Assets.imagesBedroomFurniture,
      "rating": 4.9,
    },
    {
      "id": 3,
      "name": "طاولة طعام خشبية",
      "price": "8,500 جنيه",
      "image": Assets.imagesDiningFurniture,
      "rating": 4.7,
      "discount": "عرض خاص",
    },
    {
      "id": 4,
      "name": "طقم صالون فخم",
      "price": "18,000 جنيه",
      "image": Assets.imagesHeroFurniture,
      "rating": 5.0,
    },
  ];

   HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: [
            HomeAppBar(),
            SearchWidget(
              readOnly: true,
              onTap: () {
                FocusScope.of(context).unfocus();
                GoRouter.of(context).push(AppRoute.searchView);
              },
            ),
            OfferSlider(),
            FeatureItem(categories: categories),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).FeaturedProducts,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: Text(S.of(context).SeeAll,style:AppStyles.regular13)) // See All,
              ],
            ),
            ProductsGridView(products: products),
          ],
        ),
      ),
    );
  }
}
