import 'package:get/get.dart';

class RegisterPasswordController extends GetxController {
  var oldPassword = ''.obs;
  var newPassword = ''.obs;
  var passwordVisible = false.obs;
  var confirmPasswordVisible = false.obs;
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString mobileNumber = ''.obs;
  RxString emailAddress = ''.obs;
  RxString address = ''.obs;
  var termsOfService = false.obs;
  void setFirstName(String value) {
    firstName.value = value;
  }

  void setLastName(String value) {
    lastName.value = value;
  }

  void setMobileNumber(String value) {
    mobileNumber.value = value;
  }

  void setEmailAddress(String value) {
    emailAddress.value = value;
  }

  void setAddress(String value) {
    address.value = value;
  }

  void passwordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void confirmPasswordVisibility() {
    confirmPasswordVisible.value = !confirmPasswordVisible.value;
  }
}
