import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/features/onboarding/data/models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.pages,
    required this.index,
  });

  final List<OnboardingModel> pages;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            pages[index].image,
            height: 300,
          ),
          const SizedBox(height: 40),
          Text(
            pages[index].title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            pages[index].subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
