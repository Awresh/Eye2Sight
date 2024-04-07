import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileFormController extends GetxController {
  final picker = ImagePicker();
  final Rx<File?> _image = Rx<File?>(null);
  RxString name = ''.obs;
  RxString mobileNumber = ''.obs;
  RxString emailAddress = ''.obs;
  RxString address = ''.obs;

  File? get image => _image.value;

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    } else {
       // ignore: avoid_print
       print('No image selected.');
    }
  }

  void setName(String value) {
    name.value = value;
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
}
