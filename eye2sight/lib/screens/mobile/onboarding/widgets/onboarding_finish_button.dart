import 'package:eye2sight/constants/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eye2sight/controllers/onboarding_controller.dart';

class OnboardingFinishButton extends StatelessWidget {
  final OnboardingController controller;

  const OnboardingFinishButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(30),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          controller.finishOnboarding(context);
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Obx(() => Text(
              controller.currentIndex.value == contents.length - 1
                  ? "Finish"
                  : "Next",
              style: const TextStyle(
                color: Color(0xFF7647EB),
                fontSize: 18,
              ),
            )),
      ),
    );
  }
}
