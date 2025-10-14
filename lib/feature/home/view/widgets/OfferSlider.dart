import 'dart:async';

import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/feature/home/view/widgets/offer_card.dart';
import 'package:flutter/material.dart';

class OfferSlider extends StatelessWidget {
  OfferSlider({super.key});

  final PageController controller = PageController();
  final List<String> images = [
    Assets.imagesBedroomFurniture,
    Assets.imagesDiningFurniture,
    Assets.imagesHeroFurniture,
  ];

  void startAutoSlide() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (controller.hasClients) {
        int nextPage = controller.page!.round() + 1;
        if (nextPage >= images.length) nextPage = 0;
        controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    startAutoSlide();

    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: controller,
        itemCount: images.length,
        itemBuilder: (context, index) => OfferCard(image: images[index]),
      ),
    );
  }
}
