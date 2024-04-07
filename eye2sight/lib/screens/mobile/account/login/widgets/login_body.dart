import 'package:eye2sight/controllers/login_controller.dart';
import 'package:eye2sight/widgets/app_bars/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  final LoginController loginController = LoginController();

  LoginBody({super.key});

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
          // or any other icon path
          onLeadingPressed: () {
            // Navigate back when the back button is pressed
            Navigator.pop(context);
          },
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
                const SizedBox(height: 20),
                LoginForm(controller: loginController),
                const SizedBox(height: 30),
                // Create Account link
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "New here ?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to the registration page
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
