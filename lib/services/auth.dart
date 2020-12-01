import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:forum_project/model/user.dart';

class AuthMethods {
  auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  // This custom user class
  User _userFromFirebaseUser(auth.User user) {
    return user != null ? User(userId: user.uid) : null;
  }

  Future signInWithEmailAndPass(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Firebase user
      auth.User firebaseUser = result.user;
      return firebaseUser;
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      auth.User firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPass(String email) async {
    try {
      return _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (e) {
      return print(e.toString());
    }
  }

  // Check isLoggedIn
  Future checkIsLoggedIn() {}
}
