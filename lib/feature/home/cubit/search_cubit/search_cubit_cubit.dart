import 'package:darcom_app/feature/home/cubit/search_cubit/search_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:darcom_app/feature/home/data/model/product_model.dart';
import 'package:darcom_app/feature/home/data/repo/home_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepo homeRepo;

  SearchCubit(this.homeRepo) : super(SearchInitial());

  List<ProductModel> _allProducts = [];

  Future<void> loadAllProducts() async {
    emit(SearchLoading());
    final either = await homeRepo.getProducts();

    either.fold((error) => emit(SearchFailure(error)), (products) {
      _allProducts = products;
      emit(SearchLoaded(_allProducts));
    });
  }

  void search(String query) {
    if (query.isEmpty) {
      emit(SearchLoaded(_allProducts));
      return;
    }

    final filtered = _allProducts
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(SearchLoaded(filtered));
  }
}
