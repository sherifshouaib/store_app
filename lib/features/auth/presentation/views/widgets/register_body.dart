import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/views/widgets/common_reglog_body.dart';

import 'constants.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(33),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: decorationTextfield.copyWith(
                    hintText: 'Enter Your userName : '),
              ),
              const CommonReglogBody(
                  textfield1message: 'Enter Your Email : ',
                  textfield2message: 'Enter Your Password : ',
                  buttonmessage: "Register",
                  customRowSignmessage1: 'Already have an account',
                  customRowSignmessage2: 'sign in'),
            ],
          ),
        ),
      ),
    );
  }
}
