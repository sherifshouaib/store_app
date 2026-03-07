import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential?> handleOAuthLogin(OAuthCredential credential) async {
  final auth = FirebaseAuth.instance;

  try {
    // حاول login عادي
    return await auth.signInWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'account-exists-with-different-credential') {
      final email = e.email;
      final pendingCredential = e.credential;
      if (email == null || pendingCredential == null) return null;

      final methods = await auth.fetchSignInMethodsForEmail(email);

      // لو موجود email/password → اعمل login بالباسورد الأول
      if (methods.contains('password')) {
        throw FirebaseAuthException(
          code: 'need-password',
          message: 'Account exists with Email & Password. Please login first.',
        );
      }

      // لو موجود google → login بـ Google وربط الـ credential الجديد
      if (methods.contains('google.com')) {
        final googleProvider = GoogleAuthProvider();
        final userCredential = await auth.signInWithProvider(googleProvider);

        // link credential لو هو provider جديد
        if (!userCredential.user!.providerData
            .any((p) => p.providerId == pendingCredential.providerId)) {
          await userCredential.user!.linkWithCredential(pendingCredential);
        }

        return userCredential;
      }

      // لو موجود facebook → login بـ Facebook وربط credential الجديد
      if (methods.contains('facebook.com')) {
        final facebookProvider = FacebookAuthProvider();
        final userCredential = await auth.signInWithProvider(facebookProvider);

        if (!userCredential.user!.providerData
            .any((p) => p.providerId == pendingCredential.providerId)) {
          await userCredential.user!.linkWithCredential(pendingCredential);
        }

        return userCredential;
      }
    }

    rethrow;
  }
}











// Future<UserCredential?> handleOAuthLogin(OAuthCredential credential) async {
//   final auth = FirebaseAuth.instance;

//   try {
//     // لو فيه يوزر شغال → اعمل linking
//     if (auth.currentUser != null) {
//       return await auth.currentUser!.linkWithCredential(credential);
//     }

//     // تسجيل دخول طبيعي
//     return await auth.signInWithCredential(credential);

//   } on FirebaseAuthException catch (e) {

//     // 🔥🔥🔥 ده أهم جزء اتحط
//     if (e.code == 'account-exists-with-different-credential') {

//       final email = e.email;
//       final pendingCredential = e.credential;

//       if (email == null || pendingCredential == null) return null;

//       final methods = await auth.fetchSignInMethodsForEmail(email);

//       // 🔥 لو الحساب معمول بـ password
//       if (methods.contains('password')) {
//         throw FirebaseAuthException(
//           code: 'need-password',
//           message: 'Account exists with Email & Password. Please login first.',
//         );
//       }

//       // 🔥 لو الحساب معمول بـ google
//       if (methods.contains('google.com')) {
//         final googleProvider = GoogleAuthProvider();
//         final userCredential =
//             await auth.signInWithProvider(googleProvider);
//         return await userCredential.user!
//             .linkWithCredential(pendingCredential);
//       }

//       // 🔥 لو الحساب معمول بـ facebook
//       if (methods.contains('facebook.com')) {
//         final facebookProvider = FacebookAuthProvider();
//         final userCredential =
//             await auth.signInWithProvider(facebookProvider);
//         return await userCredential.user!
//             .linkWithCredential(pendingCredential);
//       }
//     }

//     rethrow;
//   }
// }