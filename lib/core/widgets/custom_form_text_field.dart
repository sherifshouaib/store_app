import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/widgets/constants.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    required this.textfieldmessage,
    required this.icon,
    required this.texttype,
    this.onChanged,
    this.obscureText = false,
    this.validator,
  });

  final String textfieldmessage;
  final Widget? icon;
  final TextInputType? texttype;
  final Function(String)? onChanged;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.black,
      ),
      keyboardType: texttype,
      decoration: decorationTextfield.copyWith(
        hintText: textfieldmessage,
        suffixIcon: icon,
      ),
    );
  }
}
