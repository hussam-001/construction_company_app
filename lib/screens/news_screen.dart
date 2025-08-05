import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List projectNewsList = [
    {
      "id": 1,
      "description": "news 1",
      "file_url": "https://picsum.photos/200",
      "created_at": "2022-01-01",
      "main_title": "Massa Plaza",
    },
    {
      "id": 2,
      "description": "news 2",
      "file_url": "https://picsum.photos/200",
      "created_at": "2022-01-01",
      "main_title": "Massa Plaza",
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
      appBar: AppBar(title: Text("News")),
      body: projectNewsList.isNotEmpty
          ? ListView(
              children: projectNewsList.map((dynamic projectNews) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(projectNews["file_url"]),
                    ),
                  ),
                  height: 400,
                  width: double.infinity,
                  child: Material(
                    elevation: 5,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            spacing: 4,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                projectNews["main_title"],
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                projectNews["description"],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    projectNews["created_at"],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite_outline),
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.comment_outlined),
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.share_outlined),
                                    color: Colors.white,
                                  ),
                                ],
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
                "No News",
                style: TextStyle(fontSize: 20, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
