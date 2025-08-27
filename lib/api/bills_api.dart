import 'package:construction_company_app/api/auth_api.dart';
import 'package:construction_company_app/utils.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getUnpaidBills(int projectId) async {
  final token = await getUserToken();
  final response = await http.get(
    parseEndpoint('/client/getAllUnPayedBills/$projectId'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
  return processResponse(response);
}

Future<List<dynamic>> getPaidBills(int projectId) async {
  final token = await getUserToken();
  final response = await http.get(
    parseEndpoint('/client/getAllPayedBills/$projectId'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
  return processResponse(response);
}

Future<dynamic> getProjectBills(int projectId) async {
  final unpaidBills = await getUnpaidBills(projectId);
  final paidBills = await getPaidBills(projectId);
  final allBills = [...paidBills, ...unpaidBills];

  allBills.sort((dynamic a, dynamic b) {
    DateTime dateA = DateTime.parse(a["due_date"]);
    DateTime dateB = DateTime.parse(b["due_date"]);
    return dateA.compareTo(dateB);
  });

  return {
    "unpaidBills": unpaidBills,
    "paidBills": paidBills,
    "allBills": allBills,
  };
}
