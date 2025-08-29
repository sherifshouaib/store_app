import 'package:flutter/material.dart';
import 'package:store_app/core/utils/colors.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: TColor.primary,
      content: Text(message),
    ),
  );
}
