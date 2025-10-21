import 'package:darcom_app/feature/home/cubit/get_category_cubit/get_category_state.dart';
import 'package:darcom_app/feature/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  static final GetCategoryCubit _instance = GetCategoryCubit._internal();

  factory GetCategoryCubit() => _instance;

  GetCategoryCubit._internal() : super(GetCategoryInitial());

  static GetCategoryCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo = HomeRepo();
  bool _loaded = false;

  void loadCategories() async {
    if (_loaded) return;

    emit(GetCategoryLoading());

    final either = await homeRepo.getCategories();

    either.fold((error) => emit(GetCategoryFailure(error)), (categories) {
      _loaded = true;
      emit(GetCategorysSuccess(categories));
    });
  }
}
