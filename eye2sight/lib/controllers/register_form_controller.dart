import 'package:eye2sight/api/api/api_services.dart';
import 'package:eye2sight/screens/mobile/account/login/login_page.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:eye2sight/constants/uri_constants.dart';
import 'package:eye2sight/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var companyId = 2.obs; // Hardcoded companyId
  var phone = ''.obs;
  var termsAccepted = false.obs;
  var passwordVisible = false.obs;
  var confirmPasswordVisible = false.obs;
  var isLoading = false.obs;
  final box = GetStorage();
  final formKey = GlobalKey<FormState>();
  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  Future<void> register() async {
    try {
      isLoading.value = true;

      // Make use of the post method from ApiService
      final response = await apiService.post(
        URIConstants.registerURI,
        {
          'firstName': firstName.value.trim(),
          'lastName': lastName.value.trim(),
          'email': email.value.trim(),
          'password': password.value.trim(),
          'companyId': companyId.value,
          'phone': phone.value.trim(),
        },
        isAuthorized: false, // Adjust authorization as needed
      );
      if (response != null && response.statusCode == 200) {
        final responseData = response.data;
        // Add logic for successful registration, e.g., navigate to login screen
        // or show a success message
        print(responseData);
        getx.Get.to(() => const LoginPage());
      } else {
        throw Exception('Failed to register. Please try again later.');
      }
    } catch (e) {
      handleRegisterError(e);
    } finally {
      isLoading.value = false;
    }
  }

  void handleRegisterError(dynamic error) {
    CustomSnackBar.showSnackBar(
      CustomSnackBar.error,
      error.toString(),
      CustomSnackBar.error,
    );
  }

  void passwordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void confirmPasswordVisibility() {
    confirmPasswordVisible.value = !confirmPasswordVisible.value;
  }
}
