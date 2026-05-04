import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      switch (e.code) {
        case 'weak-password':
          return firebaseWeakPassword;

        case 'email-already-in-use':
          return firebaseAccountAlreadyExists;

        default:
          final message = e.message;
          return (message != null && message.isNotEmpty)
              ? "$registrationFailed: $message"
              : firebaseUnknownError;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> loginFirebaseAccount({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return loginSuccessful;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return firebaseAccountNotExist;
        case 'wrong-password':
          return firebaseIncorrectPassword;
        case 'invalid-email':
          return firebaseInvalidEmail;
        case 'user-disabled':
          return firebaseAccountDisabled;
        case 'too-many-requests':
          return firebaseTooManyRequests;
        default:
          final message = e.message;
          return (message != null && message.isNotEmpty)
              ? "$loginFailed: $message"
              : firebaseUnknownError;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
