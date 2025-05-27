import 'package:flutter/material.dart';
import 'package:shwapno_survey/Component/bottomNav.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
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
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.teal),
              title: Text("Question"),
            ),
            ListTile(
              leading: Icon(Icons.score, color: Colors.teal),
              title: Text("My Rank"),
            ),
            ListTile(
              leading: Icon(Icons.shape_line, color: Colors.teal),
              title: Text("My Outlets"),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.teal),
              title: Text("Settings"),
            ),
            const SizedBox(height: 20),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.teal),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Welcome to Shwapno Survey")),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          Center(child: Text('Dashboard')),
          Center(child: Text('Question')),
          Center(child: Text('My Outlets')),
          Center(child: Text('Settings')),
        ],
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
      ),
    );
  }
}
