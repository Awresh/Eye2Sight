import 'package:eye2sight/widgets/app_bars/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconPath: 'images/back.svg',
        title: "Report",
        onLeadingPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
