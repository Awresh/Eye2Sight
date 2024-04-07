import 'package:eye2sight/constants/onboarding_data.dart';
import 'package:eye2sight/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final OnboardingController controller;

  const OnboardingPageIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            contents.length,
            (index) => OnboardingDot(
              index: index,
              currentIndex: controller.currentIndex.value,
            ),
          ),
        ));
  }
}

class OnboardingDot extends StatelessWidget {
  final int index;
  final int currentIndex;

  const OnboardingDot({required this.index, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
    );
  }
}
