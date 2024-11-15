import 'package:flutter/material.dart';
import 'package:store_app/features/navigate_between_screens/presentation/views/bottom_navigation_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home:BottomNavigationPage() ,

    );
  }
}
