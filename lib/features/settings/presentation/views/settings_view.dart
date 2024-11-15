import 'package:flutter/material.dart';

import 'widgets/settings_list_view.dart';
import 'widgets/upper_body_of_settings_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 46,
              ),
              const UpperBodyOfSettingsView(),
              const SizedBox(
                height: 20,
              ),
              SettingsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
