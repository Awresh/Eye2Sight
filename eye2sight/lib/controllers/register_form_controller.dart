import 'package:eye2sight/api/api/api_services.dart';
import 'package:eye2sight/controllers/conectivity_controller.dart';
import 'package:eye2sight/screens/mobile/account/login/login_page.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:eye2sight/constants/uri_constants.dart';
import 'package:eye2sight/widgets/custom_snackbar.dart';

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
  final box = GetStorage();
  final ApiService apiService =
      ApiService(); // Create an instance of ApiService
  final ConnectivityController connectivityController =
      getx.Get.find<ConnectivityController>();
  Future<void> register() async {
    if (!connectivityController.isInternetAvailable.value) {
      handleRegisterError('No internet connection available.');
      return;
    }
    try {
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
        // Check if registration was successful
        if (responseData['status'] == true) {
          // Add logic for successful registration, e.g., navigate to login screen
          // or show a success message
          CustomSnackBar.showSnackBar("Success",
              "You have successfully registered.", CustomSnackBar.success);
          getx.Get.offAll(() => const LoginPage());
        } else {
          // Check if the email is already in use
          if (responseData['message'] == 'Email already in use') {
            // Show an error message to the user
            // You can use a snackbar or a dialog to display the message
            CustomSnackBar.showSnackBar(
              CustomSnackBar.error,
              'Email already in use. Please use a different email address.',
              CustomSnackBar.error,
            );
          } else if (responseData['message'] == "Phone already in use") {
            // Show an error message to the user
            // You can use a snackbar or a dialog to display the message
            CustomSnackBar.showSnackBar(
              CustomSnackBar.error,
              'Phone Number already in use. Please use a different Phone Number.',
              CustomSnackBar.error,
            );
          } else {
            throw Exception('Failed to register. Please try again later.');
          }
        }
      } else {
        throw Exception('Failed to register. Please try again later.');
      }
    } catch (e) {
      handleRegisterError(e);
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
