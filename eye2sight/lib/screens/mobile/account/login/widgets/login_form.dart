import 'package:eye2sight/controllers/login_controller.dart';
import 'package:eye2sight/screens/mobile/account/forgotPassword/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller;

  const LoginForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: TextField(
            onChanged: (value) => controller.email.value = value,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 60,
          child: Obx(
            () => TextField(
              onChanged: (value) => controller.password.value = value,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                suffixIcon: GestureDetector(
                  onTap: () => controller.togglePasswordVisibility(),
                  child: Icon(controller.passwordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
              ),
              obscureText: !controller.passwordVisible.value,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Obx(() => Checkbox(
                      value: controller.rememberMe.value,
                      activeColor: const Color(0xff75A4FE),
                      onChanged: (value) =>
                          controller.rememberMe.value = value!,
                    )),
                const Text('Remember me',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
            TextButton(
              onPressed: () {
                Get.to(() => const ForgotPasswordPage());
              },
              child: const Text('Forgot Password?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  )),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 58,
          child: ElevatedButton(
            onPressed: () {
              controller.login();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              backgroundColor: const Color(0xFF75A4FE),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
