import 'package:construction_company_app/api/bills_api.dart';
import 'package:construction_company_app/components/paid_bill_component.dart';
import 'package:construction_company_app/components/unpaid_bill_component.dart';
import 'package:construction_company_app/constants.dart';
import 'package:construction_company_app/screens/payment_screen.dart';
import 'package:flutter/material.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({super.key, required this.projectId});

  final int projectId;
  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  void handlePay(billId) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentScreen(billId: billId, projectId: widget.projectId)),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Bills"),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  "ALL",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "PAID",
                  style: TextStyle(
                    fontSize: 16,
                    color: kSuccessColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "UNPAID",
                  style: TextStyle(
                    fontSize: 16,
                    color: kDangerColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: FutureBuilder(
          future: getProjectBills(widget.projectId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return TabBarView(
              children: [
                ListView(
                  children: snapshot.data!["allBills"].map<Widget>((
                    dynamic bill,
                  ) {
                    return bill["is_paid"]
                        ? PaidBillComponent(bill: bill)
                        : UnPaidBillComponent(
                            bill: bill,
                            onPay: () => handlePay(bill["id"]),
                          );
                  }).toList(),
                ),
                ListView(
                  children: snapshot.data!["paidBills"].map<Widget>((
                    dynamic bill,
                  ) {
                    return PaidBillComponent(bill: bill);
                  }).toList(),
                ),
                ListView(
                  children: snapshot.data!["unpaidBills"].map<Widget>((
                    dynamic bill,
                  ) {
                    return UnPaidBillComponent(
                      bill: bill,
                      onPay: () => handlePay(bill["id"]),
                    );
                  }).toList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
