import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/manager/counter_cubit/counter_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/custom_row_appbar.dart';
import 'package:store_app/features/navigate_between_screens/presentation/views/widgets/myproducts_view_body.dart';


class MyProductsView extends StatelessWidget {
  const MyProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: const [
               CustomRowAppBar(),
            ],
            title: const Text('My Products'),
          ),
          body: const MyProductsViewBody(),
        );
      },
    );
  }
}
