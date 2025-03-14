import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/views/widgets/auth_selection_view_body.dart';

class AuthSelectionView extends StatelessWidget {
  const AuthSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
        ),
        body: const AuthSelectionViewBody(),
      ),
    );
  }
}
