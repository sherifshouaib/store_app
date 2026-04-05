import 'package:flutter/material.dart';

import '../../../../../core/buttons/icon_button_navigation.dart';
import '../../../../../core/utils/colors.dart';

class UpperBodyOfSettingsView extends StatelessWidget {
  const UpperBodyOfSettingsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "More",
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w800),
          ),
          IconButtonNavigation(
            navigate: () {},
            navigationIcon: Image.asset(
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
