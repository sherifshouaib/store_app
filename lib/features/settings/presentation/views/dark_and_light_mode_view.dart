import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/app_bloc/app_bloc.dart';
import 'package:store_app/features/settings/presentation/views/widgets/dark_and_light_mode_view_body.dart';

class DarkAndLightModeView extends StatelessWidget {
  const DarkAndLightModeView({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<AppBloc>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 80),
            child: DarkAndLightModeViewBody(bloc: bloc),
          ),
        ),
      ),
    );
  }
}

