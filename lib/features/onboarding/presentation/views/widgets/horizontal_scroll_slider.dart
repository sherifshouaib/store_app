
import 'package:flutter/material.dart';
import 'package:store_app/features/onboarding/data/models/onboarding_model.dart';

class HorizontalScrollSlider extends StatelessWidget {
  const HorizontalScrollSlider({
    super.key,
    required this.pages,
    required this.currentIndex,
  });

  final List<OnboardingModel> pages;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: currentIndex == index ? 24 : 8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
