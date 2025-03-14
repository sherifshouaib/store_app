import 'package:flutter/material.dart';

Widget? icon;
final decorationTextfield = InputDecoration(
  suffixIcon: icon,
  hintText: 'hintText',
  hintStyle: const TextStyle(
    color: Colors.black,
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
  border: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
  fillColor: const Color.fromARGB(250, 234, 234, 247),
  filled: true,
);
