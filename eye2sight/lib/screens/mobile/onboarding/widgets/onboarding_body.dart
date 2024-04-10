import 'package:eye2sight/constants/onboarding_data.dart';
import 'package:eye2sight/screens/mobile/onboarding/widgets/content.dart';
import 'package:flutter/material.dart';
import 'package:eye2sight/controllers/onboarding_controller.dart';
import 'onboarding_page_indicator.dart';
import 'onboarding_login_button.dart';
import 'onboarding_finish_button.dart';

class OnboardingBody extends StatelessWidget {
  final OnboardingController controller;

  const OnboardingBody({Key? key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF75A4FE),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20,
            top: 20,
            right: 20,
            bottom: 30), // Padding for the entire content
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.controller,
                itemCount: contents.length,
                onPageChanged: controller.onPageChanged,
                itemBuilder: (_, i) {
                  return Content(content: contents[i]);
                },
              ),
            ),
            OnboardingPageIndicator(controller: controller),
            const SizedBox(height: 20), // Added space between widgets
            OnboardingLoginButton(),
            const SizedBox(height: 20), // Added space between widgets
            OnboardingFinishButton(controller: controller),
          ],
        ),
      ),
    );
  }
}
