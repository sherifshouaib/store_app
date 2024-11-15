import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/views/widgets/common_reglog_body.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(33),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 33,
              ),
              CommonReglogBody(
                  textfield1message: 'Enter Your Email : ',
                  textfield2message: 'Enter Your Password : ',
                  buttonmessage: "Sign in",
                  customRowSignmessage1: 'Do not have an account?',
                  customRowSignmessage2: 'sign up'),
            ],
          ),
        ),
      ),
    );
  }
}
