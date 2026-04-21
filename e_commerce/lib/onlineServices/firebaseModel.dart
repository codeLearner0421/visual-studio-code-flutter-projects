import 'package:e_commerce/constants/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> registerFirebaseAccount(String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.sendEmailVerification();
      return firebaseEmailVerificationSent;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        return firebaseWeakPassword;
      } else if (e.code == "email-already-in-use") {
        return firebaseAccountAlreadyExists;
      } else {
        return e.message ?? firebaseUnknownError;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
