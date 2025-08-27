import 'dart:convert';

import 'package:construction_company_app/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

dynamic parseEndpoint(String endpoint) {
  final url = Uri.parse('$kApiBaseUrl$endpoint');
  return url;
}

dynamic processResponse(http.Response response) {
  final body = jsonDecode(response.body);

  if (response.statusCode == 200) return body["data"];
  final message =
      'Error ${response.statusCode}: ${body["message"] ?? 'Unknown error'}';
  if (kDebugMode) print(message);
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
  throw Exception(message);
}
