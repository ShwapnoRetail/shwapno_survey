// import 'package:flutter/material.dart';

// class DrawerWidget extends StatelessWidget {
//   const DrawerWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color:
//                     Theme.of(context).primaryColor, // Optional background color
//               ),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundImage: AssetImage('assets/images/shwapno.png'),
//                   ),
//                   const SizedBox(width: 16),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Abdul karim Baten",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       // Text(
//                       //   "ACI.data@net",
//                       //   style: TextStyle(
//                       //     fontSize: 12,
//                       //     color: Colors.white,
//                       //     overflow: TextOverflow.ellipsis,
//                       //   ),
//                       // ),
//                       Text(
//                         "01700700624",
//                         style: TextStyle(fontSize: 13, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.dashboard, color: Colors.teal),
//               title: Text(
//                 'Dashboard',
//                 style: TextStyle(fontWeight: FontWeight.w400),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.question_answer, color: Colors.teal),
//               title: Text(
//                 "Question",
//                 style: TextStyle(fontWeight: FontWeight.w400),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.score, color: Colors.teal),
//               title: Text(
//                 "My Rank",
//                 style: TextStyle(fontWeight: FontWeight.w400),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.shape_line, color: Colors.teal),
//               title: Text(
//                 "My Outlets",
//                 style: TextStyle(fontWeight: FontWeight.w400),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings, color: Colors.teal),
//               title: Text(
//                 "Settings",
//                 style: TextStyle(fontWeight: FontWeight.w400),
//               ),
//             ),
//             SizedBox(height: 20),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.logout, color: Colors.teal),
//               title: Text(
//                 "Logout",
//                 style: TextStyle(fontWeight: FontWeight.w400),
//               ),
//             ),

//             // Add more ListTiles as needed
//           ],
//         ),
//       ),
//       appBar: AppBar(title: const Text("Welcome to Shwapno Survey")),
//       body: Center(child: Text('Main Content Here')),
//     );
//   }
// }

import 'package:flutter/material.dart';

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
                    children: [
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
            SizedBox(height: 20),
            Divider(),
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
          Center(child: Text('Question ')),
          Center(child: Text('My Rank ')),
          Center(child: Text('My Outlets ')),
          Center(child: Text('Settings ')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Question',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Outlets'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
