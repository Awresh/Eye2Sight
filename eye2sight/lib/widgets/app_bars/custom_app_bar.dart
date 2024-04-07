import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String leadingIconPath;
  final Function()? onLeadingPressed;
  final String? title;

  const CustomAppBar({
    super.key,
    required this.leadingIconPath,
    required this.onLeadingPressed,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Disable default back button
      title: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: IconButton(
              icon: leadingIconPath.contains('.svg')
                  ? SvgPicture.asset(leadingIconPath)
                  : Image.asset(leadingIconPath),
              onPressed: onLeadingPressed,
            ),
          ),
          // Adjusted width
          Expanded(
            child: Center(
              child: Text(
                title ?? "",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(14),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
