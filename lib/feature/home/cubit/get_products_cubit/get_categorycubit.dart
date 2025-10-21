import 'package:darcom_app/feature/home/cubit/get_products_cubit/get_products_state.dart';
import 'package:darcom_app/feature/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  static final GetProductsCubit _instance = GetProductsCubit._internal();

  factory GetProductsCubit() => _instance;

  GetProductsCubit._internal() : super(GetProductsInitial());

  static GetProductsCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo = HomeRepo();
  bool _loaded = false;

  void loadProducts() async {
    if (_loaded) return;

    emit(GetProductsLoading());

    final either = await homeRepo.getProducts();

    either.fold((error) => emit(GetProductsFailure(error)), (products) {
      _loaded = true;
      emit(GetProductsSuccess(products));
    });
  }
}
