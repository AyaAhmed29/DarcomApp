import 'package:darcom_app/feature/home/cubit/get_slider_cubit/get_slider_state.dart';
import 'package:darcom_app/feature/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetSliderCubit extends Cubit<GetSliderState> {
  static final GetSliderCubit _instance = GetSliderCubit._internal();
  factory GetSliderCubit() => _instance;

  GetSliderCubit._internal() : super(GetSliderInitial());

  static GetSliderCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo = HomeRepo();
  bool _loaded = false;

  void loadSlider() async {
    if (_loaded) return;

    emit(GetSliderLoading());

    final either = await homeRepo.getSlider();

    either.fold((error) => emit(GetSliderFailure(error)), (slider) {
      _loaded = true;
      emit(GetSliderSuccess(slider));
    });
  }
}
