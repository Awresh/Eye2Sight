import 'package:eye2sight/screens/mobile/onboarding/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';

import 'package:eye2sight/controllers/onboarding_controller.dart';

class Onboarding extends StatelessWidget {
  final OnboardingController controller = OnboardingController();

  Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF75A4FE),
        elevation: 0,
      ),
      body: OnboardingBody(controller: controller),
    );
  }
}
