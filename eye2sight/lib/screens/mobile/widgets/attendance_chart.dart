import 'package:flutter/material.dart';

class AttendanceReportWidget extends StatelessWidget {
  const AttendanceReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 270,
            height: 270,
            child: Image.asset('images/no_data.gif', fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          const Text(
            'You have nothing here yet.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFFA4A4A4),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Mark your attendance today to see the attendance reports.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFA4A4A4),
            ),
          ),
        ],
      ),
    );
  }
}
