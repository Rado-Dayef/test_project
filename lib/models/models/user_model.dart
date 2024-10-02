class UserModel {
  String name;
  String email;
  String phoneNumber;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"],
      email: map["email"],
      phoneNumber: map["phoneNumber"],
    );
  }
}
