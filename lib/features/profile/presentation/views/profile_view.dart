import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/profile/presentation/manager/bloc/change_theme_bloc.dart';

import 'widgets/custom_text_button_icon.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
  //  var bloc = context.read<ChangeThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          // BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
          //   builder: (context, state) {
          //     return Column(
          //       children: [
          //         Text(
          //           'Dark Mode',
          //           style: TextStyle(
          //             fontSize: 11,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //         Switch(
          //           value: bloc.theme == 'dark',
          //           onChanged: (val) {
          //             bloc.add(
          //               ThemeEvent(theme: val ? 'dark' : 'light'),
          //             );
          //           },
          //         ),
          //       ],
          //     );
          //   },
          // ),
          // SizedBox(
          //   width: 150,
          // ),
          CustomTextButtonIcon(),
        ],
        title: const Text('My Profile'),
      ),
      body: const ProfileViewBody(),
    );
  }
}
