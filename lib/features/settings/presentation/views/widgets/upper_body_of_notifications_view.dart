
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../my_order_view.dart';

class UpperBodyOfNotificationsView extends StatelessWidget {
  const UpperBodyOfNotificationsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset("assets/images/btn_back.png",
                width: 20, height: 20),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              "Notifications",
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyOrderView()));
            },
            icon: Image.asset(
              "assets/images/shopping_cart.png",
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
    );
  }
}


