// ignore_for_file: avoid_print

import 'package:eye2sight/api/api/api_services.dart';
import 'package:eye2sight/widgets/bottom_bar/bottom_nav_bar.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:eye2sight/constants/getstorage_keys_constants.dart';
import 'package:eye2sight/constants/uri_constants.dart'; // Import ApiService
import 'package:eye2sight/widgets/custom_snackbar.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var rememberMe = false.obs;
  var passwordVisible = false.obs;
  var isLoading = false.obs;
  final box = GetStorage();
  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  Future<void> login() async {
    print("testing-1");
    try {
      isLoading.value = true;

      // Make use of the post method from ApiService
      final response = await apiService.post(
        URIConstants.loginURI,
        {
          'userName': email.value.trim(), // Trim the email before sending
          'password': password.value.trim(), // Trim the password before sending
        },
        isAuthorized: false, // Adjust authorization as needed
      );
      print({
        'userName': email.value.trim(),
        'password': password.value.trim(),
      });

      print(response?.data); // Print raw response data for debugging

      if (response != null && response.statusCode == 200) {
        final responseData = response.data;
        final token = responseData['result']['token'];
        box.write(GetStorageKeys.accessToken, token);

        print('Login successful');
        getx.Get.offAll(() => BottomNavBar());
        // Add logic for successful login, e.g., navigate to home screen
      } else {
        print("testing-5");
        throw Exception('Invalid email or password');
      }
    } catch (e) {
      print('Error occurred during login: $e');
      handleLoginError(e);
      print("testing-3");
    } finally {
      print("testing-4");
      isLoading.value = false;
    }
  }

  void handleLoginError(dynamic error) {
    CustomSnackBar.showSnackBar(
      CustomSnackBar.error,
      error.toString(),
      CustomSnackBar.error,
    );
  }

  void forgotPassword() {
    // Navigate to the forgot password screen
  }

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }
}
