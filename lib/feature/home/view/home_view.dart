import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:darcom_app/core/utils/app_route.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/feature/home/cubit/get_category_cubit/get_categorycubit.dart';
import 'package:darcom_app/feature/home/view/widgets/OfferSlider.dart';
import 'package:darcom_app/feature/home/view/widgets/all_feature.dart';
import 'package:darcom_app/feature/home/view/widgets/home_appbar.dart';
import 'package:darcom_app/feature/home/view/widgets/search_widget.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
 
    

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCategoryCubit()..loadCategories(),
      child: Scaffold(
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
              AllFeature(),
              Padding(
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
              ),
              // ProductsGridView(products: products),
            ],
          ),
        ),
      ),
    );
  }
}
