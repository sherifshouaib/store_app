import 'package:flutter/material.dart';

import 'widgets/notifications_list_view.dart';
import 'widgets/upper_body_of_notifications_view.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

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
              const UpperBodyOfNotificationsView(),
              NotificationsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
