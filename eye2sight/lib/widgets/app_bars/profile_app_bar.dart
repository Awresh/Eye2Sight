import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String profilePhotoUrl;
  final VoidCallback onNotificationPressed;

  const ProfileAppBar({
    super.key,
    required this.userName,
    required this.profilePhotoUrl,
    required this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Hide the back button
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(profilePhotoUrl),
            radius: 20, // Adjust the size of the profile photo
          ),
          const SizedBox(
              width: 8), // Add spacing between profile photo and name
          Text(
            userName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xFFA4A4A4), // Change the font weight to 400
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: onNotificationPressed,
          icon: SvgPicture.asset('images/notification.svg'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
