import 'package:eye2sight/controllers/register_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart'; // Updated import statement

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final RegisterController controller = RegisterController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: GestureDetector(
          onTap: () {
            // Dismiss the keyboard when tapping outside of text fields
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) =>
                              controller.firstName.value = value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'First name is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: SvgPicture.asset('images/profile.svg'),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 20), // Add some spacing between fields
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) =>
                              controller.lastName.value = value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Last name is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: SvgPicture.asset('images/profile.svg'),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Mobile Number
                  TextFormField(
                    onChanged: (value) => controller.phone.value = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Mobile number is required';
                      } else if (value.length != 10) {
                        return 'Mobile number must be 10 digits';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SvgPicture.asset('images/call.svg'),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Email Address
                  TextFormField(
                    onChanged: (value) => controller.email.value = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email address is required';
                      } else if (!GetUtils.isEmail(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      errorMaxLines: null,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SvgPicture.asset('images/message.svg'),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Password
                  SizedBox(
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
                        obscureText: !controller.passwordVisible.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SvgPicture.asset('images/password.svg'),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: controller.passwordVisibility,
                            child: Icon(controller.passwordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Confirm Password
                  SizedBox(
                    child: Obx(
                      () => TextFormField(
                        onChanged: (value) =>
                            controller.confirmPassword.value = value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm password is required';
                          } else if (value != controller.password.value) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        obscureText: !controller.confirmPasswordVisible.value,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          errorMaxLines: null,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SvgPicture.asset('images/password.svg'),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: controller.confirmPasswordVisibility,
                            child: Icon(controller.confirmPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: controller.termsAccepted.value,
                              activeColor: const Color(0xff75A4FE),
                              onChanged: (value) =>
                                  controller.termsAccepted.value = value!,
                            ),
                          ),
                          // Adjust the space between the checkbox and text
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'I accept all ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms of Service',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff75A4FE),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff75A4FE),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        _handleRegister();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        backgroundColor: const Color(0xFF75A4FE),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : const Text(
                              'Create Account',
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
          ),
        ));
  }

  void _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Set loading to true before registration
      });
      await controller.register();
      setState(() {
        _isLoading = false; // Set loading to false after registration
      });
    }
  }
}
