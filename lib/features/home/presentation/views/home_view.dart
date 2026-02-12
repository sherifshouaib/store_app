import 'package:flutter/material.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/home/presentation/views/widgets/home_view_body.dart';

import 'widgets/custom_row_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const HomeviewBody(),
      // drawer: const Drawer(
      //   child: DrawerBody(),
      // ),
      appBar: AppBar(
        // backgroundColor: appbarGreen,
        title: const Text(
          "Home",
          style: TextStyle(color: TColor.primary2),
        ),
        actions: const [CustomRowAppBar()],
      ),
    );
  }
}
