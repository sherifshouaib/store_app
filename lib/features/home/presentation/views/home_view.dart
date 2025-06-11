import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/manager/counter_cubit/counter_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/home_view_body.dart';

import 'widgets/custom_row_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      builder: (context, state) {
        return Scaffold(
          body: const HomeviewBody(),
          // drawer: const Drawer(
          //   child: DrawerBody(),
          // ),
          appBar: AppBar(
            // backgroundColor: appbarGreen,
            title: const Text("Home"),
            actions: const [CustomRowAppBar()],
          ),
        );
      },
      listener: (context, state) {
      },
    );
  }
}
