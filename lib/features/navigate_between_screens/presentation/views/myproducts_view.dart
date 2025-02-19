import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/manager/counter_cubit/counter_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/custom_row_appbar.dart';

class MyProductsView extends StatelessWidget {
  const MyProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              CustomRowAppbar(),
            ],
            title: Text('My Products'),
          ),
        //  body: MyproductsViewBody(),
        );
      },
    );
  }
}
