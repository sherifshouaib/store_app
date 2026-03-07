import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:store_app/features/onboarding/presentation/views/widgets/bottom_button.dart';
import 'package:store_app/features/onboarding/presentation/views/widgets/horizontal_scroll_slider.dart';
import 'package:store_app/features/onboarding/presentation/views/widgets/onboarding_content.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'assets/images/onboarding1.svg',
      title: 'Discover Amazing Products',
      subtitle: 'Browse thousands of products easily and find what you love.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding2.svg',
      title: 'Fast & Secure Shopping',
      subtitle: 'Enjoy smooth checkout and secure payment methods.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 81, 4),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingContent(pages: pages, index: index);
                },
              ),
            ),

            // Indicator
            HorizontalScrollSlider(pages: pages, currentIndex: currentIndex),

            const SizedBox(height: 30),

            // Button
            BottomButton(
                currentIndex: currentIndex,
                pages: pages,
                mounted: mounted,
                controller: _controller),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
