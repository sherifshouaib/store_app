import 'package:flutter/material.dart';

import 'widgets/about_us_view_body.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AboutUsViewBody(),
    );
  }
}

