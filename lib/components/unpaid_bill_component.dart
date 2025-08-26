import 'package:construction_company_app/constants.dart';
import 'package:construction_company_app/screens/payment_screen.dart';
import 'package:flutter/material.dart';

class UnPaidBillComponent extends StatelessWidget {
  const UnPaidBillComponent({super.key, required this.bill});

  int calculateDueInMonths(String deadline) {
    try {
      final parts = deadline.split('-');
      if (parts.length != 3) return 0;

      final year = int.tryParse(parts[0]) ?? 0;
      final month = int.tryParse(parts[1]) ?? 0;
      final day = int.tryParse(parts[2].split(" ")[0]) ?? 0;

      final deadlineDate = DateTime(year, month, day);
      final currentDate = DateTime.now();

      int monthsDue =
          (deadlineDate.year - currentDate.year) * 12 +
          deadlineDate.month -
          currentDate.month;

      if (deadlineDate.day < currentDate.day) {
        monthsDue--;
      }

      return monthsDue;
    } catch (e) {
      return 0;
    }
  }

  final Map bill;
  @override
  Widget build(BuildContext context) {
    final monthsDue = calculateDueInMonths(bill["due_date"]);
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الدفعة ${bill["id"]}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${bill["property_book_bill_id"]["amount"]}",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: kSuccessColor,
                        ),
                      ),
                      Text(
                        "${bill["due_date"]}",
                        style: TextStyle(fontSize: 18, color: kDangerColor),
                      ),
                      Text(
                        "Due in: $monthsDue month",
                        style: const TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Chip(
                        label: const Text(
                          "MONTHLY",
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Color(0xFFe4f2fc),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      Chip(
                        label: const Text(
                          "UNPAID",
                          style: TextStyle(
                            color: kDangerColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Color(0xFFfbe7e7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(billId: bill["id"]),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kDarkColor,
                foregroundColor: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text("Pay"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
