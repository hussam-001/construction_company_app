// import 'dart:convert';
//
// import 'package:construction_company_app/constants.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
//
// dynamic parseEndpoint(String endpoint) {
//   final url = Uri.parse('$kApiBaseUrl$endpoint');
//   return url;
// }
//
// dynamic processResponse(http.Response response) {
//   final body = jsonDecode(response.body);
//
//   if (response.statusCode == 200) return body["data"];
//   final message =
//       'Error ${response.statusCode}: ${body["message"] ?? 'Unknown error'}';
//   if (kDebugMode) print(message);
//   Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0
//   );
//   throw Exception(message);
// }
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
// التابع الصحيح
dynamic processResponse2(http.Response response) {
  // فك تشفير الاستجابة إلى JSON
  final body = jsonDecode(response.body);

  if (response.statusCode == 200) {
    // قم بالتحقق من مفتاح "notifications" بدلاً من "data"
    if (body.containsKey("notifications") && body["notifications"] != null) {
      return body["notifications"];
    }
    // إذا لم يكن المفتاح موجودًا أو كانت قيمته فارغة، أعد قائمة فارغة
    return [];
  }

  // إذا لم يكن رمز الحالة 200، قم بمعالجة الخطأ
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