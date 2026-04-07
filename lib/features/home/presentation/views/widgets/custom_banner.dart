import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    super.key,
    required this.banner,
  });

  final String banner;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        //   height: 180,
        width: 310,
        banner,
        fit: BoxFit.cover,
        //  width: double.infinity,
        // errorWidget: (context, url, error) => const Icon(
        //   Icons.error,
        //   color: Colors.black,
        // ),
      ),
    );
  }
}
