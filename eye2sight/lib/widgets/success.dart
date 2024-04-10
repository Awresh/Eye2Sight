import 'package:eye2sight/widgets/bottom_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:eye2sight/widgets/app_bars/profile_app_bar.dart';
import 'package:get/get.dart';

class Success extends StatelessWidget {
  const Success({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 158,
              height: 158,
              child: Image.asset('images/success.gif', fit: BoxFit.cover),
            ),
            const SizedBox(height: 30),
            const Text(
              'Attendance Marked Successfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => BottomNavBar());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  backgroundColor: const Color(0xFF75A4FE),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
