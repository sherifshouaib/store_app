import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/views/widgets/verify_email_view_body.dart';

class VerifyEmailView extends StatelessWidget {
  VerifyEmailView({super.key});

  static bool isEmailVerified = false;
  // bool canResendEmail = false;
  // Timer? timer;

  // @override
  // void initState() {
  //   super.initState();
  //   VerifyEmailView.isEmailVerified =
  //       FirebaseAuth.instance.currentUser!.emailVerified;

  //   if (!VerifyEmailView.isEmailVerified) {
  //     sendVerificationEmail();

  //     timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
  //       // when we click on the link that existed on yahoo
  //       await FirebaseAuth.instance.currentUser!.reload();

  //       // is email verified or not (clicked on the link or not) (true or false)
  //       setState(() {
  //         VerifyEmailView.isEmailVerified =
  //             FirebaseAuth.instance.currentUser!.emailVerified;
  //       });

  //       if (VerifyEmailView.isEmailVerified) {
  //         timer.cancel();
  //       }
  //     });
  //   }
  // }

  // sendVerificationEmail() async {
  //   try {
  //     await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  //     setState(() {
  //       canResendEmail = false;
  //     });
  //     await Future.delayed(const Duration(seconds: 5));
  //     setState(() {
  //       canResendEmail = true;
  //     });
  //   } catch (e) {
  //     showSnackBar(context, "ERROR => ${e.toString()}");
  //   }
  // }

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }
  // final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return VerifyEmailViewBody();
    
    
    // StreamBuilder(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     final user = snapshot.data;

    //     if (user != null && user.emailVerified) {
    //       return const BottomNavigationPage();
    //     }

    //     if (user != null && !user.emailVerified) {
    //       return const VerifyEmailViewBody();
    //     }

    //     return const LoginView();

    //     // if (snapshot.hasData && user !=null && user!.emailVerified == true) {
    //     //   return const BottomNavigationPage();
    //     // }  if (snapshot.hasData && user !=null && user!.emailVerified == false) {
    //     //   return const VerifyEmailViewBody();
    //     // }
    //     // return const LoginView();
    //   },
    // );

//  Scaffold(
//             appBar: AppBar(
//               title: const Text("Verify Email"),
//               elevation: 0,
//               // backgroundColor: appbarGreen,
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "A verification email has been sent to your email",
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   CustomElevatedButton(
//                     onPressed: () {
//                       canResendEmail ? sendVerificationEmail() : null;
//                     },
//                     text: "Resend Email",
//                     width: 140,
//                     colorfill: Colors.redAccent,
//                   ),
//                   const SizedBox(
//                     height: 11,
//                   ),
//                   CustomTextButton(
//                       onPressed: () {
//                         FirebaseAuth.instance.signOut();
//                       },
//                       text2: 'Cancel'),
//                 ],
//               ),
//             ),
//           );
  }
}
