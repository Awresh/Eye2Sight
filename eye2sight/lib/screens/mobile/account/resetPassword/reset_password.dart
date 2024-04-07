import 'package:eye2sight/controllers/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatelessWidget {
  final ResetPasswordController resetPasswordController =
      Get.put(ResetPasswordController());
  ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus any focused text field
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                // ignore: deprecated_member_use
                'images/back.svg',
              ),
              onPressed: () {
                // Navigate back when the back button is pressed
                Navigator.pop(context);
              },
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(14),
            ),
          ),
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
                const Text('Reset your password',
                    style: TextStyle(
                        // Set text color
                        fontSize: 24,
                        fontWeight: FontWeight.bold // Set font size
                        )),
                const Text('Please enter your new password',
                    style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                )),
                const SizedBox(height: 20),
                // Password TextField with eye icon
                SizedBox(
                  height: 60,
                  child: Obx(
                    () => TextField(
                      onChanged: (value) =>
                          resetPasswordController.oldPassword.value = value,
                      decoration: InputDecoration(
                        labelText: 'Old Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () => resetPasswordController
                              .toggleOldPasswordVisibility(),
                          child: Icon(
                              resetPasswordController.oldPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                        ),
                      ),
                      obscureText:
                          !resetPasswordController.oldPasswordVisible.value,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Password TextField with eye icon
                SizedBox(
                  height: 60,
                  child: Obx(
                    () => TextField(
                      onChanged: (value) =>
                          resetPasswordController.newPassword.value = value,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () => resetPasswordController
                              .toggleNewPasswordVisibility(),
                          child: Icon(
                              resetPasswordController.newPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                        ),
                      ),
                      obscureText:
                          !resetPasswordController.newPasswordVisible.value,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        resetPasswordController.forgotPassword();
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Change Password
                SizedBox(
                  width: double.infinity, // Set width
                  height: 58, // Set height
                  child: ElevatedButton(
                    onPressed: () {
                      resetPasswordController.changePassword();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      backgroundColor:
                          const Color(0xFF75A4FE), // Set background color
                    ),
                    child: const Text(
                      'Change Password',
                      style: TextStyle(
                        color: Colors.white, // Set text color
                        fontSize: 18, // Set font size
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
