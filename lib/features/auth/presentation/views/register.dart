import 'package:flutter/material.dart';

import 'widgets/register_body.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        body: RegisterBody(),
      ),
    );
  }
}

