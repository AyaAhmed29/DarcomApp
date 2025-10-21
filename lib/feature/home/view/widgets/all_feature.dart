
import 'package:darcom_app/feature/home/cubit/get_category_cubit/get_category_state.dart';
import 'package:darcom_app/feature/home/cubit/get_category_cubit/get_categorycubit.dart';
import 'package:darcom_app/feature/home/view/widgets/all_feature_shimmer.dart';
import 'package:darcom_app/feature/home/view/widgets/feature_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllFeature extends StatelessWidget {
  const AllFeature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryCubit, GetCategoryState>(
      builder: (context, state) {
        if (state is GetCategoryLoading) {
          return AllFeatureShimmer();
        }
    
        if (state is GetCategoryFailure) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is GetCategorysSuccess) {
          return FeatureItem(categories: state.categorys);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
