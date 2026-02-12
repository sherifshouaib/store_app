import 'package:flutter/material.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(

      backgroundColor: TColor.primary2,
      body: SplashViewBody(),
    ); 
  }
}