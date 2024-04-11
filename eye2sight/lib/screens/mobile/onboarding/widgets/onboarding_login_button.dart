import 'package:eye2sight/constants/getstorage_keys_constants.dart';
import 'package:eye2sight/screens/mobile/account/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingLoginButton extends StatelessWidget {
  OnboardingLoginButton({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () async {
          await box.write(GetStorageKeys.onboardingIsCompleted, 1);
          Get.to(() => const LoginPage());
        },
        child: const Text(
          "Already have an account? Login",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
