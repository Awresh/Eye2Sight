import 'package:eye2sight/constants/onboarding_data.dart';
import 'package:eye2sight/screens/mobile/onboarding/widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:eye2sight/controllers/onboarding_controller.dart';
import 'onboarding_page_indicator.dart';
import 'onboarding_login_button.dart';
import 'onboarding_finish_button.dart';

class OnboardingBody extends StatelessWidget {
  final OnboardingController controller;

  const OnboardingBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF75A4FE),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.controller,
              itemCount: contents.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Content(content: contents[i]),
                );
              },
            ),
          ),
          OnboardingPageIndicator(controller: controller),
          OnboardingLoginButton(),
          OnboardingFinishButton(controller: controller),
        ],
      ),
    );
  }
}
