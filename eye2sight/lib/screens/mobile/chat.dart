import 'package:eye2sight/widgets/app_bars/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconPath: 'images/back.svg',
        title: "Chat",
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
