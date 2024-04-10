import 'package:eye2sight/controllers/login_controller.dart';
import 'package:eye2sight/screens/mobile/account/forgotPassword/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller;

  const LoginForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextFormField(
              onChanged: (value) => controller.email.value = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Email is required';
                } else if (!GetUtils.isEmail(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
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
              () => TextFormField(
                onChanged: (value) => controller.password.value = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
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
                      color: Color(0xFFA4A4A4),
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
                if (_formKey.currentState!.validate()) {
                  // Validation passed, proceed with login
                  controller.login();
                }
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
      ),
    );
  }
}
