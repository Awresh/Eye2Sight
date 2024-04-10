import 'package:flutter/material.dart';

class TitalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const TitalAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Disable default back button
      title: Text(
        title ?? "",
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
