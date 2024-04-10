import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:eye2sight/controllers/edit_profile_photo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePhotoPreview extends StatelessWidget {
  final EditProfilePhotoController controller =
      Get.put(EditProfilePhotoController());

  EditProfilePhotoPreview({super.key});

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
                onTap: () async {
                  final List<XFile>? images = await showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('Choose from Gallery'),
                              onTap: () async {
                                Navigator.pop(context);
                                final ImagePicker picker = ImagePicker();
                                final List<XFile> pickedImages =
                                    await picker.pickMultiImage();
                                controller.setImages(pickedImages
                                    .map((image) => File(image.path))
                                    .toList());
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  if (images != null) {
                    controller.setImages(
                        images.map((image) => File(image.path)).toList());
                  }
                },
                child: DottedBorder(
                  color: const Color(0xFFA4A4A4),
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
                                color: Color(0xFFA4A4A4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Take your front-facing photo. Upload at least 3 photos",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFA4A4A4),
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
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              // Display selected images in a new grid only if there are selected images
              Obx(
                () {
                  if (controller.images.isNotEmpty) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Selected Images:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                          ),
                          itemCount: controller.images.length,
                          itemBuilder: (context, index) {
                            return Image.file(
                              controller.images[index],
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
