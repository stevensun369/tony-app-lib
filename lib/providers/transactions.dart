import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/url.dart';
import '../models/transaction_model.dart';

class Transactions with ChangeNotifier {
  List<TransactionModel> transactions = [];

  bool loading = true;
  String errorMessage = '';

  getTransactions(String token) async {
    loading = true;
    notifyListeners();

    final response = await http.get(
      Uri.parse('${AppURL.baseURL}/users/transactions'),
      headers: authHeader(token),
    );

    loading = false;
    notifyListeners();

    final body = json.decode(response.body);
    if (response.statusCode == 200) {
      for (int i = 0; i < body.length; i++) {
        transactions.add(TransactionModel.fromJSON(body[i]));
      }
    } else {
      errorMessage = 'eroare';
      notifyListeners();
    }
  }
}
