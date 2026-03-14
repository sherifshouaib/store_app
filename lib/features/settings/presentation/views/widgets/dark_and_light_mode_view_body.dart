import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/app_bloc/app_bloc.dart';
import 'package:store_app/core/app_bloc/app_event.dart';
import 'package:store_app/core/app_bloc/app_state.dart';
import 'package:store_app/features/settings/presentation/views/widgets/middle_text_view.dart';
import 'package:store_app/features/settings/presentation/views/widgets/upper_body_item.dart';

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
        const SizedBox(
          height: 20,
        ),
        UpperBodyItem(text: "Change Theme"),
        const SizedBox(
          height: 30,
        ),
        MiddleTextView(),
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
