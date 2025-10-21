import 'package:darcom_app/feature/home/cubit/get_products_cubit/get_categorycubit.dart';
import 'package:darcom_app/feature/home/cubit/get_products_cubit/get_products_state.dart';
import 'package:darcom_app/feature/home/view/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetProductsFailure) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is GetProductsSuccess) {
          return ProductsGridView(products: state.products);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
