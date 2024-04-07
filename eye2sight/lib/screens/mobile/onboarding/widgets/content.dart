import 'package:flutter/material.dart';

import 'package:eye2sight/model/onboarding_content_model.dart';

class Content extends StatelessWidget {
  final OnboardingContent content;

  const Content({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.transparent,
                Color.fromARGB(214, 138, 98, 238),
              ],
              stops: [0.25, 1.0],
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(content.image),
          ),
        ),
        Text(
          content.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 20),
        Text(
          content.description,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
