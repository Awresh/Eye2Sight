import 'package:flutter/material.dart';

class TitalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const TitalAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false, // Disable default back button
          title: Text(
            title ?? "",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          pinned:
              true, // Keep the app bar pinned to the top // Set the desired background color
          expandedHeight: kToolbarHeight,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
