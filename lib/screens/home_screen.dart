import 'package:construction_company_app/constants.dart';
import 'package:construction_company_app/screens/news_screen.dart';
import 'package:construction_company_app/screens/projects_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int? index;
  const HomeScreen({super.key, this.index});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    if (widget.index != null) {
      setState(() {
        _selectedIndex = widget.index!;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = <Widget>[
      ProjectsScreen(),
      NewsScreen(),
      ProjectsScreen(),
      ProjectsScreen(),
    ];

    return Scaffold(
      extendBody: true,
      body: Center(child: screens[_selectedIndex]),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: kDarkColor,
          ),
          child: BottomNavigationBar(
            unselectedIconTheme: const IconThemeData(
              color: Colors.white,
              size: 26,
            ),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            backgroundColor: Colors.transparent,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_filled),
                tooltip: "Projects",
                label: "Projects",
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.newspaper),
                tooltip: "News",
                label: "News",
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.notifications),
                tooltip: "Notifications",
                label: "Notifications",
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                tooltip: "User",
                label: "User",
                backgroundColor: Colors.white,
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
