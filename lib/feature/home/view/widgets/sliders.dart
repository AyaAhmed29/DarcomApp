
import 'package:darcom_app/feature/home/cubit/get_slider_cubit/get_slider_cubit.dart';
import 'package:darcom_app/feature/home/cubit/get_slider_cubit/get_slider_state.dart';
import 'package:darcom_app/feature/home/view/widgets/OfferSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sliders extends StatelessWidget {
  const Sliders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSliderCubit, GetSliderState>(
      builder: (context, state) {
        if (state is GetSliderLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GetSliderFailure) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is GetSliderSuccess) {
          return OfferSlider(sliderModel: state.sliderModel);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
