// import 'dart:convert';

// convertUser(value) => jsonDecode(UserModel.fromJson(value).toJson());

class UserModel {
  String uid;
  String email;
  String name;
  UserModel({this.email, this.name, this.uid});

  Map<String, dynamic> toJson() {
    return {"uid": uid, "email": email, "name": name};
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        email = json["email"],
        name = json["name"];
}
