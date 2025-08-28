import 'package:construction_company_app/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const String userTokenCacheKey = 'user_token';

Future<void> saveUserToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(userTokenCacheKey, token);
}

Future<String?> getUserToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(userTokenCacheKey);
}

Future<dynamic> signIn(String email, String password, String deviceToken) async {
  final response = await http.post(
    parseEndpoint('/client/login'),
    body: {
      'email': email,
      'password': password,
      'device_token': deviceToken,
    },
    headers: {'Accept': 'application/json'},
  );

  final data = processResponse(response);
  await saveUserToken(data['token']);
  return data;
}

Future<void> signOut() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(userTokenCacheKey);
}

Future<dynamic> changePassword(String password, String newPassword) async {
  final response = await http.patch(
    parseEndpoint('/client/changePassword'),
    body: {'password': password, 'new_password': newPassword},
    headers: {'Accept': 'application/json'},
  );
  return processResponse(response);
}
