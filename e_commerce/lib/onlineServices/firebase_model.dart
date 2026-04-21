import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> registerFirebaseAccount({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String username,
    required String phoneNumber,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        return firebaseUnknownError;
      }
      try {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'username': username,
          'phoneNumber': phoneNumber,
          'createdAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
      } on FirebaseException catch (e) {
        return e.message ?? firebaseProfileSaveFailed;
      }
      await user.sendEmailVerification();
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
