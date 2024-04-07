import 'package:dotted_border/dotted_border.dart';
import 'package:eye2sight/controllers/edit_profile_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileForm extends StatelessWidget {
  final EditProfileFormController controller =
      Get.put(EditProfileFormController());

  EditProfileForm({super.key});

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
              // Add Profile Photo
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('Choose from Gallery'),
                              onTap: () {
                                controller.getImage(ImageSource.gallery);
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_camera),
                              title: const Text('Take a Picture'),
                              onTap: () {
                                controller.getImage(ImageSource.camera);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Obx(() => DottedBorder(
                      color: Colors.grey,
                      strokeWidth: 1,
                      dashPattern: const [4, 4],
                      child: Container(
                        width: 160,
                        height: 119,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(0, 255, 255, 255),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (controller.image != null)
                              Image.file(
                                controller.image!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            if (controller.image == null)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'images/img.svg', // Replace 'your_svg_icon.svg' with your SVG file path
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Add Profile Photo',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    )),
              ),
              const SizedBox(height: 20),
              // Name
              TextFormField(
                onChanged: controller.setName,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0, // Adjust padding as needed
                    ),
                    child: SvgPicture.asset(
                      'images/profile.svg',
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.grey
                          .withOpacity(0.5)), // Adjust opacity as needed
                ),
              ),
              const SizedBox(height: 20),

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
                  labelText: 'Mobile Number',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0, // Adjust padding as needed
                    ),
                    child: SvgPicture.asset(
                      'images/call.svg',
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.grey
                          .withOpacity(0.5)), // Adjust opacity as needed
                ),
              ),
              const SizedBox(height: 20),

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
                    padding: const EdgeInsets.only(
                      left: 16.0, // Adjust padding as needed
                    ),
                    child: SvgPicture.asset(
                      'images/message.svg',
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.grey
                          .withOpacity(0.5)), // Adjust opacity as needed
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                onChanged: controller.setAddress,
                decoration: InputDecoration(
                  labelText: 'Address',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0, // Adjust padding as needed
                    ),
                    child: SvgPicture.asset(
                      'images/location.svg',
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.grey
                          .withOpacity(0.5)), // Adjust opacity as needed
                ),
              ),

              const SizedBox(height: 30),
              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Changes button press
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    backgroundColor: const Color(0xFF75A4FE),
                  ),
                  child: const Text(
                    'Save Changes',
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
