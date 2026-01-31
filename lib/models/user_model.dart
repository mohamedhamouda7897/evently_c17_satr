class UserModel {
  String name;
  String id;
  String email;

  UserModel({this.id = "", required this.name, required this.email});

  UserModel.fromJson(Map<String, dynamic> json)
    : this(id: json['id'], name: json['name'], email: json['email']);

  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "id": id};
  }
}
