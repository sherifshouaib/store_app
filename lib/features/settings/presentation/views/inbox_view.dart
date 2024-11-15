import 'package:flutter/material.dart';

import 'widgets/inbox_list_view.dart';
import 'widgets/upper_body_of_inbox_view.dart';

class InboxView extends StatefulWidget {
  const InboxView({super.key});

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView> {
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
              const UpperBodyOfInboxView(),
              InboxListView(),
            ],
          ),
        ),
      ),
    );
  }
}
