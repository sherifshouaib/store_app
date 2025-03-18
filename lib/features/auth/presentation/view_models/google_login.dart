import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  static final googleSignIn = GoogleSignIn();
  static GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  static googlelogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleSignIn == null) return;
    _user = googleUser;
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
