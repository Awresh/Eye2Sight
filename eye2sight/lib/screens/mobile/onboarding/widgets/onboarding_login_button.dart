import 'package:eye2sight/screens/mobile/account/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(LoginPage());
      },
      child: const Text(
        "Already have an account? Login",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
