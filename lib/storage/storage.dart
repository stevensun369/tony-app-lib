import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

setUser(UserModel user, String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('token', token);

  await prefs.setString('user.ID', user.id);
  await prefs.setString('user.walletID', user.walletID);
  await prefs.setString('user.username', user.username);
  await prefs.setString('user.phone', user.phone);
}

Future<UserModel> getUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return UserModel(
      id: prefs.getString('user.ID') ?? '',
      walletID: prefs.getString('user.walletID') ?? '',
      username: prefs.getString('user.username') ?? '',
      phone: prefs.getString('user.phone') ?? '');
}

Future<String> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString('token') ?? '';
}
