import 'package:flutter/material.dart';

Widget? icon;
final decorationTextfield = InputDecoration(
  suffixIcon: icon,
  hintText: 'hintText',
  hintStyle: const TextStyle(
    color: Colors.black,
  ),
  // enabledBorder: const OutlineInputBorder(
  //   borderSide: BorderSide(color: Color.fromARGB(255, 245, 81, 4)),
  // ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 245, 81, 4)),
  ),
  // border: const OutlineInputBorder(
  //   borderSide: BorderSide(color: Color.fromARGB(255, 245, 81, 4)),
  // ),
  fillColor: const Color.fromARGB(250, 234, 234, 247),
  filled: true,
);
