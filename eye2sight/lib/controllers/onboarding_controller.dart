import 'package:eye2sight/constants/getstorage_keys_constants.dart';
import 'package:eye2sight/constants/onboarding_data.dart';
import 'package:eye2sight/screens/mobile/account/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  final box = GetStorage();
  final PageController controller = PageController(initialPage: 0);
  var currentIndex = 0.obs;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  Future<void> finishOnboarding(BuildContext context) async {
    if (currentIndex.value == contents.length - 1) {
      await box.write(GetStorageKeys.onboardingIsCompleted, 1);
      Get.offAll(() => const LoginPage());
      // Get.to(() => BottomNavBar());
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
