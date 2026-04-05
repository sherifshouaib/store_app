import 'package:flutter/material.dart';
import 'package:store_app/features/settings/presentation/views/widgets/upper_body_item.dart';


class UpperBodyOfNotificationsView extends StatelessWidget {
  const UpperBodyOfNotificationsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: UpperBodyItem(text: "Notifications" ),
    );
  }
}

 