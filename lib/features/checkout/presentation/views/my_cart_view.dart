import 'package:flutter/material.dart';
import 'package:store_app/core/buttons/custom_appbar.dart';
import 'package:store_app/features/checkout/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'My Cart',
      ),
      body: const MyCartViewBody(),
    );
  }
}
