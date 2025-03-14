// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import '../../../../../core/buttons/custom_elevated_button.dart';
// import '../../../../../core/utils/app_router.dart';
// import '../../../../../core/utils/function/show_snack_bar.dart';
// import '../../../../../core/widgets/custom_form_text_field.dart';

// class CommonReglogBody extends StatefulWidget {
//   const CommonReglogBody({
//     super.key,
//     required this.textfield1message,
//     required this.textfield2message,
//     required this.buttonmessage,
//   });

//   final String textfield1message, textfield2message, buttonmessage;

//   @override
//   State<CommonReglogBody> createState() => _CommonReglogBodyState();
// }

// class _CommonReglogBodyState extends State<CommonReglogBody> {
//   GlobalKey<FormState> formKey = GlobalKey();

//   bool isLoading = false;

//   String? email, password;
//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: isLoading,
//       child: Column(
//         children: [
//           CustomFormTextField(
//             onChanged: (data) {
//               email = data;
//             },
//             texttype: TextInputType.emailAddress,
//             textfieldmessage: widget.textfield1message,
//             icon: const Icon(Icons.email),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           CustomFormTextField(
//             onChanged: (data) {
//               password = data;
//             },
//             texttype: TextInputType.text,
//             textfieldmessage: widget.textfield2message,
//             icon: const Icon(Icons.visibility_rounded),
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           CustomElevatedButton(
//             colorfill: Colors.redAccent,
//             text: widget.buttonmessage,
//             onPressed: () async {
//               if (formKey.currentState!.validate()) {
//                 isLoading = true;
//                 setState(() {});

//                 try {
//                   await loginUser();
//                   showSnackBar(context, 'success');
//                   GoRouter.of(context).push(
//                     AppRouter.kLoginView,
//                     // extra: ProductModel,
//                   );
//                   // Navigator.push(context, );
//                 } on FirebaseAuthException catch (ex) {
//                   if (ex.code == 'weak-password') {
//                     showSnackBar(context, 'weak password');
//                   } else if (ex.code == 'email-already-in-use') {
//                     showSnackBar(context, 'email already exists');
//                   }
//                 } catch (ex) {
//                   showSnackBar(context, 'there was an error');
//                 }
//                 isLoading = false;
//                 setState(() {});
//               } else {}
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> loginUser() async {
//     UserCredential user = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email!, password: password!);
//   }
// }
