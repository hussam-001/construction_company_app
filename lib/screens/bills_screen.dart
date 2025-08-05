import 'package:construction_company_app/components/paid_bill_component.dart';
import 'package:construction_company_app/components/unpaid_bill_component.dart';
import 'package:construction_company_app/constants.dart';
import 'package:construction_company_app/screens/project_details_screen.dart';
import 'package:flutter/material.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({super.key, required this.projectId});

  final int projectId;
  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  List paidBills = [
    {
      "id": 1,
      "cost": 14438,
      "deadline": "2025-07-05 20:59:47",
      "date_of_payment": "2025-07-19 16:34:54",
      "order_book_id": 2,
      "created_by": 1,
      "updated_by": 1,
      "deleted_by": null,
      "created_at": "2025-07-05T16:34:54.000000Z",
      "updated_at": "2025-07-05T16:34:54.000000Z",
      "deleted_at": null,
    },
    {
      "id": 3,
      "cost": 18317,
      "deadline": "2025-07-05 20:59:54",
      "date_of_payment": "2025-07-31 16:34:54",
      "order_book_id": 2,
      "created_by": 1,
      "updated_by": 1,
      "deleted_by": null,
      "created_at": "2025-07-05T16:34:54.000000Z",
      "updated_at": "2025-07-05T16:34:54.000000Z",
      "deleted_at": null,
    },
    {
      "id": 5,
      "cost": 6844,
      "deadline": "2025-07-05 21:00:01",
      "date_of_payment": "2025-08-12 16:34:54",
      "order_book_id": 2,
      "created_by": 1,
      "updated_by": 1,
      "deleted_by": null,
      "created_at": "2025-07-05T16:34:54.000000Z",
      "updated_at": "2025-07-05T16:34:54.000000Z",
      "deleted_at": null,
    },
    {
      "id": 11,
      "cost": 10611,
      "deadline": "2025-07-16 16:34:54",
      "date_of_payment": "2025-07-12 16:34:54",
      "order_book_id": 2,
      "created_by": 1,
      "updated_by": 1,
      "deleted_by": null,
      "created_at": "2025-07-05T16:34:54.000000Z",
      "updated_at": "2025-07-05T16:34:54.000000Z",
      "deleted_at": null,
    },
    {
      "id": 13,
      "cost": 16653,
      "deadline": "2025-08-08 16:34:54",
      "date_of_payment": "2025-08-07 16:34:54",
      "order_book_id": 2,
      "created_by": 1,
      "updated_by": 1,
      "deleted_by": null,
      "created_at": "2025-07-05T16:34:54.000000Z",
      "updated_at": "2025-07-05T16:34:54.000000Z",
      "deleted_at": null,
    },
    {
      "id": 14,
      "cost": 5057,
      "deadline": "2025-07-05 21:01:12",
      "date_of_payment": "2025-07-28 16:34:54",
      "order_book_id": 2,
      "created_by": 1,
      "updated_by": 1,
      "deleted_by": null,
      "created_at": "2025-07-05T16:34:54.000000Z",
      "updated_at": "2025-07-05T16:34:54.000000Z",
      "deleted_at": null,
    },
  ];
  List unpaidBills = [
    {
      "id": 2,
      "cost": 18590,
      "deadline": "2025-07-05 20:59:51",
      "date_of_payment": null,
      "order_book_id": 2,
      "created_by": 1,
      "updated_by": 1,
      "deleted_by": null,
      "created_at": "2025-07-05T16:34:54.000000Z",
      "updated_at": "2025-07-05T16:34:54.000000Z",
      "deleted_at": null,
    },
    {
      "id": 4,
      "cost": 10299,
      "deadline": "2025-07-05 20:59:58",
      "date_of_payment": null,
      "order_book_id": 2,
      "created_by": 1,
      "updated_by": 1,
      "deleted_by": null,
      "created_at": "2025-07-05T16:34:54.000000Z",
      "updated_at": "2025-07-05T16:34:54.000000Z",
      "deleted_at": null,
    },
    {
      "id": 8,
      "cost": 14465,
      "deadline": "2025-08-11 16:34:54",
      "date_of_payment": null,
      "order_book_id": 2,
      "created_by": 1,
      "updated_by": 1,
      "deleted_by": null,
      "created_at": "2025-07-05T16:34:54.000000Z",
      "updated_at": "2025-07-05T16:34:54.000000Z",
      "deleted_at": null,
    },
  ];
  List allBillsSorted = [];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    allBillsSorted = [...paidBills, ...unpaidBills];

    allBillsSorted.sort((a, b) {
      DateTime dateA = DateTime.parse(a["deadline"]);
      DateTime dateB = DateTime.parse(b["deadline"]);
      return dateA.compareTo(dateB);
    });
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
        body: TabBarView(
          children: [
            ListView(
              children: allBillsSorted.map((dynamic bill) {
                return bill["date_of_payment"] != null
                    ? PaidBillComponent(bill: bill)
                    : UnPaidBillComponent(bill: bill);
              }).toList(),
            ),
            ListView(
              children: paidBills.map((dynamic bill) {
                return PaidBillComponent(bill: bill);
              }).toList(),
            ),
            ListView(
              children: unpaidBills.map((dynamic bill) {
                return UnPaidBillComponent(bill: bill);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
