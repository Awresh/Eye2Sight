import 'package:eye2sight/screens/mobile/account/register/widgets/register_form.dart';

import 'package:eye2sight/widgets/app_bars/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
      body: RegisterForm(),
    );
  }
}
