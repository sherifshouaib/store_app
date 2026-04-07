import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/views/widgets/verify_email_view_body.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  static bool isEmailVerified = false;

  @override
  Widget build(BuildContext context) {
    return VerifyEmailViewBody();
  }
}
