import 'package:construction_company_app/api/auth_api.dart';
import 'package:construction_company_app/utils.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getProjects() async {
  final token = await getUserToken();
  final response = await http.get(
    parseEndpoint('/client/projects'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );
  return processResponse(response);
}

