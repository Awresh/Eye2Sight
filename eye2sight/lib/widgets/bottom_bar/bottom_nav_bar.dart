import 'package:eye2sight/controllers/bottom_nav_bar_controller.dart';
import 'package:eye2sight/screens/mobile/chat.dart';
import 'package:eye2sight/screens/mobile/home.dart';
import 'package:eye2sight/screens/mobile/report.dart';
import 'package:eye2sight/screens/mobile/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavBarController controller = Get.put(BottomNavBarController());

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // List of pages where the bottom navigation bar should be visible
    final List<int> visiblePages = [0, 1, 2, 3];

    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: [
              const Home(),
              const Chat(),
              const Report(),
              Setting(),
            ],
          )),
      bottomNavigationBar: Obx(() {
        // Check if the current page index is in the list of visible pages
        if (visiblePages.contains(controller.currentIndex.value)) {
          return BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.changeTabIndex(index);
            },
            selectedItemColor: const Color(0xFF75A4FE),
            unselectedItemColor: const Color(0xFFA4A4A4),
            items: [
              _buildBottomNavigationBarItem(
                  Icons.home, 'Home', 'images/home.svg', 0),
              _buildBottomNavigationBarItem(
                  Icons.chat, 'Chat', 'images/chat.svg', 1),
              _buildBottomNavigationBarItem(
                  Icons.report, 'Report', 'images/report.svg', 2),
              _buildBottomNavigationBarItem(
                  Icons.settings, 'Settings', 'images/setting.svg', 3),
            ],
          );
        } else {
          // Return an empty container if the bottom navigation bar should be hidden
          return Container();
        }
      }),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData iconData, String label, String iconPath, int index) {
    bool isSelected = controller.currentIndex.value == index;
    return BottomNavigationBarItem(
      icon: isSelected
          ? SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              color: const Color(0xFF75A4FE),
            )
          : SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              color: const Color(0xFFA4A4A4),
            ),
      label: label,
    );
  }
}
