import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/features/home/presentation/views/widgets/home_view_body.dart';

import '../../../navigate_between_screens/presentation/views/widgets/custom_row_appbar.dart';
import '../../../navigate_between_screens/presentation/views/widgets/drawer_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeviewBody(),
      drawer: const Drawer(
        child: DrawerBody(),
      ),
      appBar: AppBar(
       // backgroundColor: appbarGreen,
        title: const Text("Home"),
        actions: const [CustomRowAppbar()],
      ),
    );
  }
}






