class UserModel {
  String id = '';
  String walletID = '';
  String username = '';
  String phone = '';

  UserModel(
      {required this.id,
      required this.walletID,
      required this.username,
      required this.phone});

  factory UserModel.fromJSON(Map<String, dynamic> json) {
    return UserModel(
      id: json['ID'],
      walletID: json['walletID'] ?? '',
      username: json['username'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'ID': id,
      'walletID': walletID,
      'username': username,
      'phone': phone,
    };
  }
}
