import 'package:darcom_app/core/widgets/custom_appbar.dart';
import 'package:darcom_app/feature/home/data/model/product_model.dart';
import 'package:darcom_app/feature/home/view/widgets/prodect_image.dart';
import 'package:darcom_app/feature/home/view/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra;
    final product = extra != null ? extra as ProductModel : null;

    return Scaffold(
      appBar: CustomAppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
        title: '',
      ),
      body: Column(
        children: [
          ProdectImage(product: product),
          ProductDetails(product: product!),
        ],
      ),
    );
  }
}
