import 'package:darcom_app/feature/home/cubit/search_cubit/search_cubit_cubit.dart';
import 'package:darcom_app/feature/home/view/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:darcom_app/feature/home/cubit/search_cubit/search_cubit_state.dart';
import 'package:darcom_app/feature/home/data/repo/home_repo.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(HomeRepo())..loadAllProducts(),
      child: const _SearchBody(),
    );
  }
}

class _SearchBody extends StatefulWidget {
  const _SearchBody();

  @override
  State<_SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<_SearchBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type product name...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<SearchCubit>().search(value);
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchLoaded) {
                  final products = state.products;
                  if (products.isEmpty) {
                    return const Center(child: Text('No results found'));
                  }
                  return ProductsGridView(products: products);
                } else if (state is SearchFailure) {
                  return Center(child: Text(state.error));
                }
                return const Center(child: Text('Start searching...'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
