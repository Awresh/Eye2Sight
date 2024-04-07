import 'package:eye2sight/screens/mobile/account/login/login_page.dart';
import 'package:eye2sight/widgets/app_bars/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus any focused text field
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          leadingIconPath: 'images/back.svg',
          onLeadingPressed: () {
            Navigator.pop(context);
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Your custom icon
                Center(
                  child: Image.asset(
                    'images/loginIcon.png', // Change this to your image path
                    // Adjust the width of the icon as needed
                  ),
                ),
                const SizedBox(height: 30),

                const Text('Forgot Password',
                    style: TextStyle(
                        // Set text color
                        fontSize: 24,
                        fontWeight: FontWeight.bold // Set font size
                        )),
                const Text('We’ll send you a new password to your email',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    )),
                const SizedBox(height: 20),
                // Email TextField
                SizedBox(
                  height: 60, // Adjust the height as needed
                  child: TextField(
                    // onChanged: (value) => (loginController.email.value) = value,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                  
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity, // Set width
                  height: 58, // Set height
                  child: ElevatedButton(
                    onPressed: () {
                      // loginController.login();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      backgroundColor:
                          const Color(0xFF75A4FE), // Set background color
                    ),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white, // Set text color
                        fontSize: 18, // Set font size
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Create Account link
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Remembered your password?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        )),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const LoginPage());
                      },
                      child: const Text('Login',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff75A4FE),
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                // Add extra spacing at the bottom
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
