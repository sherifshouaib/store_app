import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/app_bloc/app_bloc.dart';
import 'package:store_app/core/app_bloc/app_event.dart';
import 'package:store_app/core/app_bloc/app_state.dart';

class DarkAndLightModeViewBody extends StatelessWidget {
  const DarkAndLightModeViewBody({
    super.key,
    required this.bloc,
  });

  final AppBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Choose how your Amazooon experience looks for this device'),
        SizedBox(
          height: 50,
        ),
        Text('Dark Mode'),
        BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Switch(
              value: bloc.theme == 'dark',
              onChanged: (val) {
                bloc.add(ThemeEvent(theme: val ? "dark" : "light"));
              },
            );
          },
        ),
      ],
    );
  }
}
