import 'package:flutter/material.dart';

import 'user_account_details.dart';

class DrawerUpperBody extends StatelessWidget {
  const DrawerUpperBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserAccountDetails(),
        ListTile(
            title: const Text("Home"),
            leading: const Icon(Icons.home),
            onTap: () {}),
        ListTile(
            title: const Text("My products"),
            leading: const Icon(Icons.add_shopping_cart),
            onTap: () {}),
        ListTile(
            title: const Text("About"),
            leading: const Icon(Icons.help_center),
            onTap: () {}),
        ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {}),
      ],
    );
  }
}
