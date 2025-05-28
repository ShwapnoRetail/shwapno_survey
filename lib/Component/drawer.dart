import 'package:flutter/material.dart';
import 'package:shwapno_survey/Component/bottomNav.dart';
import 'package:shwapno_survey/Screen/Survey/surveyOutlet.dart';
import 'package:shwapno_survey/Screen/Survey/surveyPage.dart';
import 'package:shwapno_survey/Screen/Survey/surveyQuestion.dart'; // Add this import

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/shwapno.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Abdul karim Baten",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "01700700624",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.teal),
              title: Text('Dashboard'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                  _pageController.jumpToPage(0);
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.teal),
              title: Text("Question"),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                  _pageController.jumpToPage(1);
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.score, color: Colors.teal),
              title: Text("My Rank"),
            ),
            ListTile(
              leading: Icon(
                Icons.store,
                color: Colors.teal,
              ), // Changed icon to match bottom nav
              title: Text("My Outlets"),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                  _pageController.jumpToPage(2);
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.teal),
              title: Text("Settings"),
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                  _pageController.jumpToPage(3);
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            const SizedBox(height: 20),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.teal),
              title: Text("Logout"),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(_getAppBarTitle(_selectedIndex)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          const SurveyHomePage(),
          const SurveyQuestionScreen(), // Question screen
          const SurveyOutletScreen(), // Outlets screen
          const Center(child: Text('Settings')), // Settings screen
        ],
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
      ),
    );
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return "Survey Dashboard";
      case 1:
        return "Questions";
      case 2:
        return "My Outlets";
      case 3:
        return "Settings";
      default:
        return "Welcome";
    }
  }
}
