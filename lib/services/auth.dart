import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  registerUser(String emailAddress, String password, String hofID) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print(credential);
      return credential;
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      //won't be reached
      return e;
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
