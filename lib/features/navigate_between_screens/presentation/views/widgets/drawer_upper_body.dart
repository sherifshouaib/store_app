

import 'package:flutter/material.dart';

class DrawerUpperBody extends StatelessWidget {
  const DrawerUpperBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/test.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          accountName: Text(
            "ali Hassan",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          accountEmail: Text("ali@yahoo.com"),
          currentAccountPicture: CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage("assets/images/ali.jpg"),
          ),
        ),
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

