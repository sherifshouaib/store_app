import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/app_router.dart';
import 'package:store_app/features/onboarding/data/models/onboarding_model.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.currentIndex,
    required this.pages,
    required this.mounted,
    required PageController controller,
  }) : _controller = controller;

  final int currentIndex;
  final List<OnboardingModel> pages;
  final bool mounted;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color.fromARGB(255, 245, 81, 4),
          ),
          onPressed: () {
            if (currentIndex == pages.length - 1) {
              if (!mounted) return; // 🔥 مهم جدًا
              context.go(AppRouter.kLoginView);
              // GoRouter.of(context)
              //     .pushReplacement(AppRouter.kLoginView);
            } else {
              _controller.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Text(
            currentIndex == pages.length - 1 ? 'Get Started' : 'Next',
          ),
        ),
      ),
    );
  }
}
