import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/Models/user_model.dart';
import 'package:weather_app/Services/database.dart';
import 'package:weather_app/locator.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DatabaseService _firestoreService = locator<DatabaseService>();

  UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      // verify user account
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String name,
  }) async {
    // ignore: unused_local_variable
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    try {
      // create user account
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _currentUser = UserModel(
        uid: authResult.user.uid,
        email: email,
        name: name,
      );
      // create a new user profile on firestore
      await _firestoreService.createUser(_currentUser);

      /// not necessary but for the task porpose
      /// saving user data to shared preference to sustain usr session
      // await _sharedPreferences.setString("User", convertUser(_currentUser));

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  logOut() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    try {
      /// clearing user data from both firestore
      /// and shared preferences
      await _firebaseAuth.signOut();
      await _sharedPreferences.clear();
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    //checking if a user is logged in(if any user data exist)
    var user = await _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  // ignore: deprecated_member_use
  Future _populateCurrentUser(FirebaseUser user) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);

      /// not necessary but for the task porpose
      /// saving user data to shared preference to sustain usr session
      // await _sharedPreferences.setString("User", userModelToJson(_currentUser));
    }
  }
}
