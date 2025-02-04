import 'package:flutter/material.dart';

import 'favorites_view.dart';
import '../../../home/presentation/views/home_view.dart';
import 'myproducts_view.dart';
import 'profile_view.dart';
import '../../../settings/presentation/views/settings_view.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int myCurrentIndex = 2;

  List pages = const [
    FavoritesView(),
    MyProductsView(),
    HomeView(),
    SettingsView(),
    ProfileView(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 30,
              offset: const Offset(0, 20),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: myCurrentIndex,
            backgroundColor: Colors.white,
            selectedItemColor: const Color.fromARGB(255, 237, 19, 95),
            unselectedItemColor: Colors.black,
            selectedFontSize: 12,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                myCurrentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: 'Favourite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_shopping_cart), label: 'My Products'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Profile'),
            ],
          ),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}
