import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/styles.dart';

class Custom_Cart_View_AppBar extends StatelessWidget {
  const Custom_Cart_View_AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Center(
        child: SvgPicture.asset(
          'assets/images/arrow.svg',
          height: 20,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: const Text(
        'My Cart',
        textAlign: TextAlign.center,
        style: Styles.textStylecheckout25,
      ),
    );
  }
}
