import 'package:construction_company_app/components/project_detail_item.dart';
import 'package:construction_company_app/constants.dart';
import 'package:flutter/material.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key, required this.projectId});

  final int projectId;
  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  Map projectData = {
    "first_payment_amount": "100000.00",
    "first_payment_date": "2025-07-28",
    "model": "A",
    "price": "1000000.00",
    "space": 2,
    "description":
        "Alias odio iusto ipsam eos. Illum sint id non sed quia aut consequatur.",
    "number_of_rooms": 3,
    "number_of_bathrooms": 3,
    "direction": "south",
    "diagram_image":
        "http://127.0.0.1:8000/storage/property-books/5316b805-1ca5-4093-a1ec-5283b8c67bed.jpg",
  };

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Project Details")),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => BillsScreen(
            //           projectId: widget.projectId,
            //         )));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "الأقساط",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 48,
          children: [
            ProjectDetailItem(
              icon: Icons.attach_money,
              label: "Price",
              value: "${projectData["price"]}",
            ),
            ProjectDetailItem(
              icon: Icons.square_foot,
              label: "Space",
              value: "${projectData["space"]}",
            ),
            ProjectDetailItem(
              icon: Icons.description,
              label: "Description",
              value: "${projectData["description"]}",
            ),
            ProjectDetailItem(
              icon: Icons.meeting_room,
              label: "Number Of Rooms",
              value: "${projectData["number_of_rooms"]}",
            ),
            ProjectDetailItem(
              icon: Icons.bathtub_rounded,
              label: "Number Of Bathrooms",
              value: "${projectData["number_of_bathrooms"]}",
            ),
            ProjectDetailItem(
              icon: Icons.explore,
              label: "Direction",
              value: "${projectData["direction"]}",
            ),
            ProjectDetailItem(
              icon: Icons.confirmation_num,
              label: "Unit Number",
              value: "${widget.projectId}",
            ),
          ],
        ),
      ),
    );
  }
}
