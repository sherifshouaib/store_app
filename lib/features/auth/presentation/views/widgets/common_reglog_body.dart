import 'package:flutter/material.dart';

import '../login_view.dart';
import 'constants.dart';
import '../../../../../core/buttons/custom_row_sign.dart';
import '../../../../../core/buttons/custom_textbutton.dart';

class CommonReglogBody extends StatelessWidget {
  const CommonReglogBody(
      {super.key,
      required this.textfield1message,
      required this.textfield2message,
      required this.buttonmessage,
      required this.customRowSignmessage1,
      required this.customRowSignmessage2});

  final String textfield1message,
      textfield2message,
      buttonmessage,
      customRowSignmessage1,
      customRowSignmessage2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        TextField(
          keyboardType: TextInputType.text,
          obscureText: false,
          decoration: decorationTextfield.copyWith(hintText: textfield1message),
        ),
        const SizedBox(
          height: 33,
        ),
        TextField(
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: decorationTextfield.copyWith(hintText: textfield2message),
        ),
        const SizedBox(
          height: 33,
        ),
        CustomElevatedButton(
          text: buttonmessage,
        ),
        const SizedBox(
          height: 33,
        ),
        CustomRowSign(
          text1: customRowSignmessage1,
          text2: customRowSignmessage2,
          specificclass: const LoginView(),
        ),
      ],
    );
  }
}
