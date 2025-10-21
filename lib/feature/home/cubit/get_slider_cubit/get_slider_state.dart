import 'package:darcom_app/feature/home/data/model/slider_model.dart';

sealed class GetSliderState {}

final class GetSliderInitial extends GetSliderState {}

final class GetSliderLoading extends GetSliderState {}

final class GetSliderSuccess extends GetSliderState {
  final List<SliderModel> sliderModel;

  GetSliderSuccess(this.sliderModel);
}

final class GetSliderFailure extends GetSliderState {
  final String errorMessage;

  GetSliderFailure(this.errorMessage);
}
