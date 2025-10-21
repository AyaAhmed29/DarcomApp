import 'package:darcom_app/core/utils/app_route.dart';
import 'package:darcom_app/feature/home/cubit/get_category_cubit/get_categorycubit.dart';
import 'package:darcom_app/feature/home/cubit/get_products_cubit/get_categorycubit.dart';
import 'package:darcom_app/feature/home/cubit/get_slider_cubit/get_slider_cubit.dart';
import 'package:darcom_app/feature/home/view/widgets/all_feature.dart';
import 'package:darcom_app/feature/home/view/widgets/all_products.dart';
import 'package:darcom_app/feature/home/view/widgets/featured_products_header.dart';
import 'package:darcom_app/feature/home/view/widgets/home_appbar.dart';
import 'package:darcom_app/feature/home/view/widgets/search_widget.dart';
import 'package:darcom_app/feature/home/view/widgets/sliders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetCategoryCubit()..loadCategories()),
        BlocProvider(create: (context) => GetSliderCubit()..loadSlider()),
        BlocProvider(create: (context) => GetProductsCubit()..loadProducts()),
      ],
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            // await Future.wait([
            //   GetSliderCubit.get(context).reloadSlider(),
            //   GetCategoryCubit.get(context).reloadCategories(),
            // ]);
          },
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              HomeAppBar(),
              SearchWidget(
                readOnly: true,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  GoRouter.of(context).push(AppRoute.searchView);
                },
              ),
              Sliders(),
              AllFeature(),
              FeaturedProductsHeader(),
              AllProducts(),
            ],
          ),
        ),
      ),
    );
  }
}