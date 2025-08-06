import 'package:shared_preferences/shared_preferences.dart';

const String userTokenCacheKey = 'user_token';

Future<void> saveUserToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(userTokenCacheKey, token);
}

Future<String?> getUserToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(userTokenCacheKey);
}
