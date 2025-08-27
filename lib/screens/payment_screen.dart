import 'package:construction_company_app/api/payment_api.dart';
import 'package:construction_company_app/api/project_api.dart';
import 'package:construction_company_app/components/project_detail_item.dart';
import 'package:construction_company_app/constants.dart';
import 'package:construction_company_app/screens/bills_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.projectId, required this.billId});

  final int billId;
  final int projectId;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  CardFieldInputDetails? _card;
  bool showSpinner = false;
  String? errorMessage;

  void handlePay() async {
    if (_card == null || !_card!.complete) return;
    setState(() {
      showSpinner = true;
    });
    try {
      final token = await createCardToken(_card!);
      await doPayment(widget.billId, token.id);
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BillsScreen(projectId: widget.projectId)),
      );
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CardFormField(
              style: CardFormStyle(
                cursorColor: kPrimaryColor,
                placeholderColor: Colors.grey,
              ),
              onCardChanged: (card) {
                setState(() {
                  _card = card;
                });
              },
            ),
            errorMessage != null
                ? Text(errorMessage!, style: const TextStyle(color: Colors.red))
                : const SizedBox(height: 15),
            showSpinner
                ? Center(child: CircularProgressIndicator(color: kPrimaryColor))
                : ElevatedButton(
                    onPressed: handlePay,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      "Pay Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
