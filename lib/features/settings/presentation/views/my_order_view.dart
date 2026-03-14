import 'package:flutter/material.dart';
import 'package:store_app/features/settings/presentation/views/widgets/my_orders_list_view.dart';
import 'package:store_app/features/settings/presentation/views/widgets/upper_body_of_myorders_view.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          UpperBodyOfMyordersView(),
          MyOrdersListView(),
        ],
      ),
    );
  }
}
