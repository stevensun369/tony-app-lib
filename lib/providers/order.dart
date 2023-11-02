import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/url.dart';
import '../models/order_model.dart';

class Order with ChangeNotifier {
  OrderModel order = OrderModel(
    id: '',
    storeID: '',
    clerkID: '',
    receipt: [],
    transactionID: '',
    value: 0,
    date: '',
    time: '',
  );

  bool loading = true;
  String errorMessage = '';

  getOrder(String token, String id) async {
    loading = true;
    notifyListeners();

    final response = await http.get(
      Uri.parse('${AppURL.baseURL}/orders/user?orderID=$id'),
      headers: authHeader(token),
    );

    loading = false;
    notifyListeners();

    final body = json.decode(response.body);
    if (response.statusCode == 200) {
      order = OrderModel.fromJSON(body);
    } else {
      errorMessage = 'eroare';
      notifyListeners();
    }
  }
}
