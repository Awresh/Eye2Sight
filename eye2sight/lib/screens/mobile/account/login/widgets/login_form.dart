import 'package:eye2sight/controllers/login_controller.dart';
import 'package:eye2sight/screens/mobile/account/forgotPassword/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final LoginController _controller = LoginController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            child: TextFormField(
              onChanged: (value) => setState(() {
                _controller.email.value = value;
              }),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email is required';
                }
                if (!GetUtils.isEmail(value.trim())) {
                  return 'Enter a valid email address';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            child: Obx(
              () => TextFormField(
                onChanged: (value) => setState(() {
                  _controller.password.value = value;
                }),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Password is required';
                  }
                  if (value.trim().length < 6) {
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
                    onTap: () => _controller.togglePasswordVisibility(),
                    child: Icon(_controller.passwordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                obscureText: !_controller.passwordVisible.value,
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
                        value: _controller.rememberMe.value,
                        activeColor: const Color(0xff75A4FE),
                        onChanged: (value) => setState(() {
                          _controller.rememberMe.value = value!;
                        }),
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
              onPressed: _isLoading ? null : () => _handleLogin(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                backgroundColor: const Color(0xFF75A4FE),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : const Text(
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

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await _controller.login();
      setState(() {
        _isLoading = false;
      });
    }
  }
}
