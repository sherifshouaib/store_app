

import 'package:flutter/material.dart';
import 'package:store_app/core/utils/colors.dart';

class AnimationSliderDot extends StatelessWidget {
  const AnimationSliderDot({
    super.key,
    required this.banners,
    required this.currentIndex,
  });

  final List<String> banners;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: banners.asMap().entries.map((entry) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentIndex == entry.key ? 12 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == entry.key
                ? TColor.primary2
                : Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }).toList(),
    );
  }
}
