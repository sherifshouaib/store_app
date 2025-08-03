// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../../../../../core/utils/app_router.dart';
// import '../../../../profile/presentation/views/widgets/user_account_details.dart';

// class DrawerUpperBody extends StatelessWidget {
//   const DrawerUpperBody({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
    
//     return Column(
//       children: [
//          UserAccountDetails(),
//         ListTile(
//             title: const Text("Home"),
//             leading: const Icon(Icons.home),
//             onTap: () {}),
//         ListTile(
//             title: const Text("My products"),
//             leading: const Icon(Icons.add_shopping_cart),
//             onTap: () {}),
//         ListTile(
//             title: const Text("About"),
//             leading: const Icon(Icons.help_center),
//             onTap: () {}),
//         ListTile(
//             title: const Text("Logout"),
//             leading: const Icon(Icons.exit_to_app),
//             onTap: () async {
//               GoogleSignIn googleSignIn = GoogleSignIn();
//               googleSignIn.disconnect();
//               await FirebaseAuth.instance.signOut();
              
//               GoRouter.of(context).pushReplacement(
//                 AppRouter.kLoginView,
//               );
//             }),
//       ],
//     );
//   }
// }
