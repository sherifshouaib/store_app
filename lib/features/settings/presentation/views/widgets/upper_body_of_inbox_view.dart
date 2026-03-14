import 'package:flutter/material.dart';
import 'package:store_app/features/settings/presentation/views/widgets/upper_body_item.dart';


class UpperBodyOfInboxView extends StatelessWidget {
  const UpperBodyOfInboxView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: UpperBodyItem(
        text: 'Inbox',
      ),
    );
  }
}
