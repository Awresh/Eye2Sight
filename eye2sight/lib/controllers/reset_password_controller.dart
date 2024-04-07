import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  var oldPassword = ''.obs;
  var newPassword = ''.obs;
  var oldPasswordVisible = false.obs;
  var newPasswordVisible = false.obs;

  void toggleOldPasswordVisibility() {
    oldPasswordVisible.value = !oldPasswordVisible.value;
  }

  void toggleNewPasswordVisibility() {
    newPasswordVisible.value = !newPasswordVisible.value;
  }

  void changePassword() {
    // Implement password change functionality
  }

  void forgotPassword() {
    // Implement forgot password functionality
  }
}
