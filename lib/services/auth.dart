import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_app/models/auth_mode.dart';
import 'package:ui_app/models/user.dart';

mixin AuthService on Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLodaing;
  // Sign in anon
  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(id: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with email & pass
  Future<FirebaseUser> signInFun(String email, String password,
      [AuthMode mode = AuthMode.Login]) async {
    _isLodaing = true;
    notifyListeners();

    if (mode == AuthMode.Login) {
      AuthResult response = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = response.user;
      return user;
    } else {
      AuthResult response = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = response.user;
      return user;
    }
  }

  // Create user
  Future registerFunc(String email, String password) async {
    try {
      AuthResult response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = response.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
