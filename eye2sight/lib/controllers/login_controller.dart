// ignore_for_file: avoid_print

import 'package:eye2sight/api/api/api_services.dart';
import 'package:eye2sight/controllers/conectivity_controller.dart';
import 'package:eye2sight/screens/mobile/account/resetPassword/reset_password.dart';
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
  final box = GetStorage();
  final ApiService apiService =
      ApiService(); // Create an instance of ApiService
  final ConnectivityController connectivityController =
      getx.Get.find<ConnectivityController>();
  Future<void> login() async {
    try {
      // Make use of the post method from ApiService
      final response = await apiService.post(
        URIConstants.loginURI,
        {
          'userName': email.value.trim(), // Trim the email before sending
          'password': password.value.trim(), // Trim the password before sending
        },
        isAuthorized: false, 
      ); 

      if (response != null) {
        final responseData = response.data;
        if (responseData['status']) {
          CustomSnackBar.showSnackBar("Success",
              "You have successfully logged in.", CustomSnackBar.success);

          // Login successful
          final token = responseData['result']['token'];
          await box.write(GetStorageKeys.accessToken, token);
          getx.Get.delete<LoginController>();
          getx.Get.offAll(() => BottomNavBar());
        } else {
          // Login failed due to incorrect credentials
          handleLoginError(responseData['message']);
        }
      } else {
        // Request failed or response is null
        handleLoginError('Failed to connect to the server');
      }
    } catch (e) {
      print('Error occurred during login: $e');
      handleLoginError(e);
    } finally {}
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
    getx.Get.to(() => ResetPasswordPage());
  }

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }
}
