


import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/routing/app_router.dart';
import 'package:store_app/core/utils/colors.dart';
import 'package:store_app/features/auth/presentation/views/verify_email_view.dart';
import '../../../../../core/buttons/custom_elevated_button.dart';
import '../../../../../core/buttons/custom_text_button.dart';
import '../../../../../core/utils/function/show_snack_bar.dart';

class VerifyEmailViewBody extends StatefulWidget {
  const VerifyEmailViewBody({super.key});
  static bool isSentCancel = false;

  @override
  State<VerifyEmailViewBody> createState() => _VerifyEmailViewBodyState();
}

class _VerifyEmailViewBodyState extends State<VerifyEmailViewBody> {
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;
    VerifyEmailView.isEmailVerified = user?.emailVerified ?? false;

    if (!VerifyEmailView.isEmailVerified && user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        sendVerificationEmail();
      });

      timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
        final user = FirebaseAuth.instance.currentUser;

        // 👇 لو المستخدم عمل logout
        if (user == null) {
          timer.cancel();
          return;
        }

        try {
          await user.reload();
        } catch (e) {
          debugPrint("Reload failed: $e");
          return;
        }

        final refreshedUser = FirebaseAuth.instance.currentUser;

        if (refreshedUser == null) {
          timer.cancel();
          return;
        }

        if (!mounted) return;

        setState(() {
          VerifyEmailView.isEmailVerified =
              refreshedUser.emailVerified;
        });

        if (VerifyEmailView.isEmailVerified) {
          timer.cancel();

          if (!mounted) return;

          GoRouter.of(context).pushReplacement(
            AppRouter.kBottomNavigationPage,
          );
        }
      });
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) return; // 👈 مهم جدًا

      await user.sendEmailVerification();

      if (!mounted) return;

      setState(() {
        canResendEmail = false;
      });

      await Future.delayed(const Duration(seconds: 5));

      if (!mounted) return;

      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      if (!mounted) return;
      showSnackBar(context, "ERROR => ${e.toString()}");
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "A verification email has been sent to your email",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),

              CustomElevatedButton(
                onPressed: canResendEmail
                    ? sendVerificationEmail
                    : null,
                text: "Resend Email",
                width: 170,
                colorfill: TColor.primary2,
              ),

              const SizedBox(height: 11),

              CustomTextButton(
                onPressed: () {
                  VerifyEmailViewBody.isSentCancel = true;
                  timer?.cancel(); // 👈 نقفل التايمر قبل الخروج
                  GoRouter.of(context).pop();
                },
                text2: 'Cancel',
              ),
            ],
          ),
        ),
      ),
    );
  }
}







// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:store_app/core/routing/app_router.dart';
// import 'package:store_app/core/utils/colors.dart';
// import 'package:store_app/features/auth/presentation/views/verify_email_view.dart';

// import '../../../../../core/buttons/custom_elevated_button.dart';
// import '../../../../../core/buttons/custom_text_button.dart';
// import '../../../../../core/utils/function/show_snack_bar.dart';

// class VerifyEmailViewBody extends StatefulWidget {
//   const VerifyEmailViewBody({super.key});
//   static bool isSentCancel = false;

//   @override
//   State<VerifyEmailViewBody> createState() => _VerifyEmailViewBodyState();
// }

// class _VerifyEmailViewBodyState extends State<VerifyEmailViewBody> {
//   bool canResendEmail = false;

//   Timer? timer;


//   @override
//   void initState() {
//     super.initState();
//     final user = FirebaseAuth.instance.currentUser;

//     VerifyEmailView.isEmailVerified = user?.emailVerified ?? false;

//     if (!VerifyEmailView.isEmailVerified) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         sendVerificationEmail();
//       });

//       //   sendVerificationEmail();

//       timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
//         //  if (VerifyEmailViewBody.isSentCancel == true) return;

// ////////////////////////////////////////////////////////////
//         final user = FirebaseAuth.instance.currentUser;
//         if (user != null) {
//           try {
//             await user.reload();
//             debugPrint("User reloaded successfully.");
//           } catch (e) {
//             debugPrint("Reload failed: $e");
//           }
//         } else {
//           debugPrint("User is null, probably logged out.");
//           timer.cancel(); // وقف التايمر عشان ميفضلش يشتغل بعد اللوج آوت
//           return;
//         }
// //////////////////////////////////////////////////////////
//         // when we click on the link that existed on yahoo
//         await FirebaseAuth.instance.currentUser!.reload();

//         // is email verified or not (clicked on the link or not) (true or false)
//         if (FirebaseAuth.instance.currentUser != null) {
//           setState(() {
//             VerifyEmailView.isEmailVerified =
//                 FirebaseAuth.instance.currentUser!.emailVerified;
//           });
//         }
//         if (VerifyEmailView.isEmailVerified) {
//           timer.cancel();
//           if (!mounted) return;

//           GoRouter.of(context).push(
//             AppRouter.kBottomNavigationPage,
//             // extra: ProductModel,
//           );
//         }
//       });
//     }
//   }

//   sendVerificationEmail() async {
//     try {
//       await FirebaseAuth.instance.currentUser!.sendEmailVerification();

//       // if (VerifyEmailViewBody.isSentCancel == true) return;

//       setState(() {
//         canResendEmail = false;
//       });

//       await Future.delayed(const Duration(seconds: 5));
//       setState(() {
//         canResendEmail = true;
//       });
//     } catch (e) {
//       if (!mounted) return;
//       showSnackBar(context, "ERROR => ${e.toString()}");
//     }
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Verify Email"),
//         elevation: 0,
//         // backgroundColor: appbarGreen,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 "A verification email has been sent to your email",
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               CustomElevatedButton(
//                 onPressed: () {
//                   canResendEmail ? sendVerificationEmail() : null;
//                 },
//                 text: "Resend Email",
//                 width: 170,
//                 colorfill: TColor.primary,
//               ),
//               // ElevatedButton(
//               //   onPressed: () {
//               //     // canResendEmail? sendVerificationEmail() : null;
//               //   },
//               //   style: ButtonStyle(
//               //     backgroundColor: MaterialStateProperty.all(BTNgreen),
//               //     padding:
//               //         MaterialStateProperty.all(const EdgeInsets.all(12)),
//               //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//               //         borderRadius: BorderRadius.circular(8))),
//               //   ),
//               //   child: const Text(
//               //     "Resent Email",
//               //     style: TextStyle(fontSize: 20),
//               //   ),
//               // ),
//               const SizedBox(
//                 height: 11,
//               ),

//               CustomTextButton(
//                 onPressed: () {
//                   VerifyEmailViewBody.isSentCancel = true;
//                   GoRouter.of(context).pop();
//                   //  FirebaseAuth.instance.signOut();
//                 },
//                 text2: 'Cancel',
//               ),
//               // CustomElevatedButton(
//               //   onPressed: () {
//               //     //     FirebaseAuth.instance.signOut();
//               //   },
//               //   text: 'Cancel',
//               //   colorfill: Colors.redAccent,
//               // ),
//               // ElevatedButton(
//               //   onPressed: () {
//               //     FirebaseAuth.instance.signOut();
//               //   },
//               //   style: ButtonStyle(
//               //     backgroundColor: MaterialStateProperty.all(BTNpink),
//               //     padding:
//               //         MaterialStateProperty.all(const EdgeInsets.all(12)),
//               //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//               //         borderRadius: BorderRadius.circular(8))),
//               //   ),
//               //   child: const Text(
//               //     "Cancel",
//               //     style: TextStyle(fontSize: 20),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
