import 'package:flutter/material.dart';

import 'widgets/forgot_password_view_body.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        elevation: 0,
      ),
      body: const ForgotPasswordViewBody(),
    );
  }
}
