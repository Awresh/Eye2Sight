import 'package:eye2sight/controllers/register_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterForm extends StatelessWidget {
  final RegisterPasswordController controller =
      Get.put(RegisterPasswordController());

  RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              const Text("Register",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: controller.setFirstName,
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
                  const SizedBox(width: 20), // Add some spacing between fields
                  Expanded(
                    child: TextFormField(
                      onChanged: controller.setLastName,
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
                onChanged: controller.setMobileNumber,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Mobile number is required';
                  }
                  // Add additional validation here if needed
                  return null;
                },
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
                onChanged: controller.setEmailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email address is required';
                  } else if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email Address',
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
              // Address
              TextFormField(
                onChanged: controller.setAddress,
                decoration: InputDecoration(
                  labelText: 'Address',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: SvgPicture.asset('images/location.svg'),
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
                height: 60,
                child: Obx(
                  () => TextField(
                    obscureText: !controller.passwordVisible
                        .value, // Hide the password if not visible
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
                        onTap: () => controller.passwordVisibility(),
                        child: Icon(controller.passwordVisible.value
                            ? Icons.visibility
                            : Icons
                                .visibility_off), // Change icon based on visibility state
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Confirm Password
              SizedBox(
                height: 60,
                child: Obx(
                  () => TextField(
                    obscureText: !controller.confirmPasswordVisible
                        .value, // Hide the password if not visible
                    onChanged: (value) => {},
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SvgPicture.asset('images/password.svg'),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () => controller.confirmPasswordVisibility(),
                        child: Icon(controller.confirmPasswordVisible.value
                            ? Icons.visibility
                            : Icons
                                .visibility_off), // Change icon based on visibility state
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
                          value: controller.termsOfService.value,
                          activeColor: const Color(0xff75A4FE),
                          onChanged: (value) =>
                              controller.termsOfService.value = value!,
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
                    // Handle Save Changes button press
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    backgroundColor: const Color(0xFF75A4FE),
                  ),
                  child: const Text(
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
    );
  }
}
