class UserModel {
  String uid;
  String email;
  String name;
  UserModel({this.email, this.name, this.uid});

  Map<String, dynamic> userToJson() {
    return {"uid": uid, "email": email, "name": name};
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"],
        email = json["email"],
        name = json["name"];
}
