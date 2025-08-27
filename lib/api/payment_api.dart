import 'package:construction_company_app/api/auth_api.dart';
import 'package:construction_company_app/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

Future<TokenData> createCardToken(CardFieldInputDetails card) async {
  final token = await Stripe.instance.createToken(
    CreateTokenParams.card(params: CardTokenParams()),
  );
  if (kDebugMode) print("token $token");
  return token;
}

Future<dynamic> doPayment(int billId, String stripeToken) async {
  final token = await getUserToken();
  final response = await http.post(
    parseEndpoint('/client/doPayments/$billId'),
    body: {'stripe_token': stripeToken},
    headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
  );
  return processResponse(response);
}
