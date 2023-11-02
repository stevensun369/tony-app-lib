import 'dart:convert';

import 'package:flutter/material.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class Wallet with ChangeNotifier {
  int balance = 0;

  bool loading = true;
  String errorMessage = '';

  getBalance(String token) async {
    loading = true;
    notifyListeners();

    final response = await http.get(
      Uri.parse('${AppURL.baseURL}/users/wallet'),
      headers: authHeader(token),
    );

    loading = false;
    notifyListeners();

    final body = json.decode(response.body);
    if (response.statusCode == 200) {
      balance = body['balance'];
    } else {
      errorMessage = 'eroare';
      notifyListeners();
    }
  }
}
