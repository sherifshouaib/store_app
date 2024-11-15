import 'package:flutter/material.dart';

class IconButtonNavigation extends StatelessWidget {
  const IconButtonNavigation({
    super.key,
    required this.navigationIcon,
    required this.navigate,
  });

  final Widget navigationIcon;
  final void Function()? navigate;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: navigate,
      icon: navigationIcon,
    );
  }
}
