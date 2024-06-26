import 'package:eye2sight/screens/mobile/account/register/register_page.dart';
import 'package:eye2sight/widgets/app_bars/tital_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus any focused text field
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const TitalAppBar(
          title: "",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'images/loginIcon.png',
                    // Adjust the width of the icon as needed
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const LoginForm(),
                const SizedBox(height: 30),
                // Create Account link
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "New here ?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFA4A4A4),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const RegisterPage());
                      },
                      child: const Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff75A4FE),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
