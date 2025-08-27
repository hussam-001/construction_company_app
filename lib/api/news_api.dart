import 'package:construction_company_app/api/auth_api.dart';
import 'package:construction_company_app/utils.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getNews() async {
  final token = await getUserToken();
  final response = await http.get(
    parseEndpoint('/client/news'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
  return processResponse(response);
}
