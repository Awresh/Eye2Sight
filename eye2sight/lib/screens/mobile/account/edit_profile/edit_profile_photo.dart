import 'package:eye2sight/screens/mobile/account/edit_profile/widgets/edit_profile_photo_select.dart';
import 'package:eye2sight/widgets/app_bars/custom_app_bar.dart';
import 'package:flutter/material.dart';

class EditProfilePhoto extends StatelessWidget {
  const EditProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconPath: 'images/back.svg',
        title: "Edit Profile",
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
      body: EditProfilePhotoPreview(),
    );
  }
}
