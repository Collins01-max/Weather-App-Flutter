import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/Models/user_model.dart';

class DatabaseService {
  final CollectionReference _usersCollectionReference =
      // ignore: deprecated_member_use
      Firestore.instance.collection('users');

  manage(e) {
    if (e is PlatformException) {
      return e.message;
    }

    return e.toString();
  }

  Future createUser(UserModel user) async {
    try {
      // creating user in database
      await _usersCollectionReference
          // ignore: deprecated_member_use
          .document(user.uid)
          // ignore: deprecated_member_use
          .setData(user.toJson());
    } catch (e) {
      manage(e);
    }
  }

  Future getUser(String uid) async {
    try {
      // retriving user in database
      // ignore: deprecated_member_use
      var userData = await _usersCollectionReference.document(uid).get();
      return UserModel.fromJson(userData.data());
    } catch (e) {
      manage(e);
    }
  }
}
