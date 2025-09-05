import 'package:construction_company_app/api/auth_api.dart';
import 'package:construction_company_app/constants.dart';
import 'package:flutter/material.dart';
import '../api/notification.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late Future<List<dynamic>> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: FutureBuilder(
        future: _notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Data Available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final notification = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification["title"] ?? "No title",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              notification["data"]["message"] ?? "No content",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Row(
                                //   children: [
                                //     const Icon(
                                //       Icons.info_outline,
                                //       color: Colors.grey,
                                //       size: 16,
                                //     ),
                                //     const SizedBox(width: 5),
                                //     // Text(
                                //     //   notification["data"]["extra"] ?? "",
                                //     //   style: const TextStyle(
                                //     //     fontSize: 14,
                                //     //     color: Colors.grey,
                                //     //   ),
                                //     // ),
                                //   ],
                                // ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      color: Colors.grey,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      notification["created_at"].toString().substring(0, 10),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}