import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
    print(currentIndex.value);
  }
}
