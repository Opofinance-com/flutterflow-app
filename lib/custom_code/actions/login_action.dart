// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> loginAction(
  String? user,
  String? pass,
) async {
  final body = {
    'email': user,
    'password': pass,
  };

  // Send a POST request to the login API endpoint with the JSON body
  final response = await http.post(
    Uri.parse('https://myaccount.opofinance.com/client-api/login'),
    body: json.encode(body),
    headers: {'Content-Type': 'application/json'},
  );

  final data = json.decode(response.body);

  final cookie = response.headers['Set-Cookie'];
  final headers = response.headers;
  // Navigate to next screen
  return headers;
}
