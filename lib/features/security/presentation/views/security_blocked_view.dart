import 'package:flutter/material.dart';
import 'package:store_app/features/security/presentation/views/widgets/securiyt_blocked_view_body.dart';

class SecurityBlockedView extends StatelessWidget {
  const SecurityBlockedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SecurityBlockedViewBody(),
    );
  }
}
