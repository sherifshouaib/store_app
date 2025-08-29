import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/views/widgets/custom_row_appbar.dart';
import 'package:store_app/features/navigate_between_screens/presentation/views/widgets/myproducts_view_body.dart';


class MyProductsView extends StatelessWidget {
  const MyProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
           CustomRowAppBar(),
        ],
        title: const Text('My Products'),
      ),
      body: const MyProductsViewBody(),
    );
  }
}
