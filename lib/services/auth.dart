import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutte_fire_learning/models/user.dart';

class AuthService {
  Users? _userFromFirebaseUser(User? user) {
    return user != null ? Users(uid: user.uid.toString()) : null;
  }

  Users? get user {
    Users? currentUser;
    FirebaseAuth.instance.authStateChanges().map((user) {
      currentUser = _userFromFirebaseUser(user);
      return null;
    });
    return currentUser;
  }

  Future signUpWithEmailandPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? newUser = userCredential.user;
      return _userFromFirebaseUser(newUser);
    } catch (e) {
      print("error is $e");
      return null;
    }
  }

  ///sign in anonymously
  Future signInAnonymously() async {
    try {
      UserCredential result = await FirebaseAuth.instance.signInAnonymously();
      User? finalUser = result.user;
      return _userFromFirebaseUser(finalUser);
    } catch (e) {
      return null;
    }
  }

  ///sign in with email password
  ///sign out
}
