import 'package:flutter/material.dart';

import 'widgets/about_us_list_view.dart';
import 'widgets/upper_body_of_about_us.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              const UpperBodyOfAboutUs(),
              AboutUsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
