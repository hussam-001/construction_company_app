import 'package:construction_company_app/api/auth_api.dart';
import 'package:construction_company_app/utils.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getNotification() async {
  final token = await getUserToken();
  final response = await http.get(
    parseEndpoint('/client/notifications'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
  return processResponse2(response);
}
