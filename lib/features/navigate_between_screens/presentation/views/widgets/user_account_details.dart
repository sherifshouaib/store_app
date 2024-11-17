import 'package:flutter/material.dart';

class UserAccountDetails extends StatelessWidget {
  const UserAccountDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const UserAccountsDrawerHeader(
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
    );
  }
}
