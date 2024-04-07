// ignore_for_file: avoid_print

import 'package:eye2sight/screens/mobile/account/forgotPassword/forgot_password.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Observable variables for email, password, remember me checkbox, and password visibility
  var email = ''.obs;
  var password = ''.obs;
  var rememberMe = false.obs;
  var passwordVisible = false.obs;

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  // Method to handle login
  void login() {
    // Implement your login logic here
    print('Email: ${email.value}');
    print('Password: ${password.value}');
    print('Remember Me: ${rememberMe.value}');
    // Navigate to the next screen after successful login
  }

  // Method to handle forgot password
  void forgotPassword() {
    Get.to(() => const ForgotPasswordPage());
    // Navigate to the forgot password screen
  }
}
