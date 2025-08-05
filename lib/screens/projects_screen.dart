import 'package:construction_company_app/constants.dart';
import 'package:construction_company_app/screens/project_details_screen.dart';
import 'package:flutter/material.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  List projects = [
    {
      "id": 1,
      "main_image": "https://picsum.photos/200",
      "main_title": "Massa Plaza",
      "marketing_description": "Mall In Midan",
      "address": "Damascus - Midan",
      "expected_date_of_completed": "2022-01-01",
      "progress_percentage": 50,
    },
    {
      "id": 2,
      "main_image": "https://picsum.photos/200",
      "main_title": "Massa Plaza 2",
      "marketing_description": "Mall In Midan",
      "address": "Damascus - Midan",
      "expected_date_of_completed": "2022-01-01",
      "progress_percentage": 20,
    },
  ];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Projects")),
      body: projects.isNotEmpty
          ? ListView(
              children: projects.map((dynamic project) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(project["main_image"]),
                    ),
                  ),
                  height: 300,
                  width: double.infinity,
                  child: Material(
                    elevation: 5,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProjectDetailsScreen(projectId: project["id"]),
                          ),
                        );
                      },
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            spacing: 4,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project["main_title"],
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(color: Colors.white),
                              Text(
                                project["marketing_description"],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  Icon(Icons.location_pin, color: Colors.white),
                                  Text(
                                    project["address"],
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Expected Completion: ${project["expected_date_of_completed"]}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Progress:",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              LinearProgressIndicator(
                                value: project["progress_percentage"] / 100,
                                color: kGreenShade,
                                borderRadius: BorderRadius.circular(24),
                                minHeight: 10,
                                backgroundColor: Color(0x50ffffff),
                              ),
                              Text(
                                '${project["progress_percentage"]}%',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            )
          : Center(
              child: Text(
                "No Projects",
                style: TextStyle(fontSize: 20, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
