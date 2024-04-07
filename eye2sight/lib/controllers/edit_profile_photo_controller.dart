import 'dart:io';

import 'package:get/get.dart';

class EditProfilePhotoController extends GetxController {
  var images = <File>[].obs;

  void setImages(List<File> newImages) {
    images.clear();
    images.addAll(newImages);
  }
}
