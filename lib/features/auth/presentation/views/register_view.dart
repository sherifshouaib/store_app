import 'package:flutter/material.dart';

import 'widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        body: RegisterBody(),
      ),
    );
  }
}

