import 'package:eye2sight/constants/onboarding_data.dart';
import 'package:eye2sight/widgets/bottom_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Import statements

class OnboardingController extends GetxController {
  final PageController controller = PageController(initialPage: 0);
  var currentIndex = 0.obs;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void finishOnboarding(BuildContext context) {
    if (currentIndex.value == contents.length - 1) {
      // Get.offAll(() => LoginPage());
      Get.to(() => BottomNavBar());
    } else {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
