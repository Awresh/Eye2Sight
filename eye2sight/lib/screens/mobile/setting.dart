import 'package:eye2sight/screens/mobile/account/edit_profile/edit_profile_photo.dart';
import 'package:eye2sight/screens/mobile/account/otp_validation/otp_validation.dart';
import 'package:eye2sight/widgets/app_bars/tital_app_bar.dart';
import 'package:eye2sight/widgets/success.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eye2sight/screens/mobile/account/edit_profile/edit_profile_page.dart';
import 'package:eye2sight/screens/mobile/account/login/login_page.dart';
import 'package:eye2sight/screens/mobile/account/register/register_page.dart';
import 'package:eye2sight/screens/mobile/account/forgotPassword/forgot_password.dart';
import 'package:eye2sight/screens/mobile/account/resetPassword/reset_password.dart';
import 'package:eye2sight/screens/mobile/onboarding/onbording.dart';
import 'package:get_storage/get_storage.dart';

class Setting extends StatelessWidget {
  Setting({super.key});
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitalAppBar(title: 'Setting'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => const EditProfilePage());
              },
              child: const Text('Edit Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const EditProfilePhoto());
              },
              child: const Text('Edit Profile Photo'),
            ),
            ElevatedButton(
              onPressed: () {
                box.remove('accessToken'); // Remove the token from the box
                Get.offAll(() => const LoginPage());
              },
              child: const Text('Log Out'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ResetPasswordPage());
              },
              child: const Text('Reset Password'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ForgotPasswordPage());
              },
              child: const Text('Forgot Password'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => RegisterPage());
              },
              child: const Text('Register'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const OTPValidationPage());
              },
              child: const Text('OTP Validation'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => Onboarding());
              },
              child: const Text('Onboarding'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const Success(),
                );
              },
              child: const Text('Successful'),
            ),
          ],
        ),
      ),
    );
  }
}
