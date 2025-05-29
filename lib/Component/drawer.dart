import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shwapno_survey/Component/bottomNav.dart';
import 'package:shwapno_survey/Screen/Profile/settings.dart';
import 'package:shwapno_survey/Screen/Survey/surveyOutlet.dart';
import 'package:shwapno_survey/Screen/Survey/surveyQuestion.dart';

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
        width: 280.w,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32.r,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 36.w,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Abdul karim Baten",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "01700700624",
                        style: TextStyle(fontSize: 13.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              context,
              icon: Icons.dashboard,
              title: 'Dashboard',
              index: 0,
            ),
            _buildDrawerItem(
              context,
              icon: Icons.question_answer,
              title: "Question",
              index: 1,
            ),
            _buildDrawerItem(
              context,
              icon: Icons.score,
              title: "My Rank",
              index: -1, // No associated page
              onTap: () {
                // Handle My Rank separately
                Navigator.pop(context);
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.store,
              title: "My Outlets",
              index: 2,
            ),
            _buildDrawerItem(
              context,
              icon: Icons.settings,
              title: "Settings",
              index: 3,
            ),
            SizedBox(height: 20.h),
            const Divider(),
            _buildDrawerItem(
              context,
              icon: Icons.logout,
              title: "Logout",
              index: -1,
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
        title: Text(
          _getAppBarTitle(_selectedIndex),
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, size: 24.w),
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
        children: const [
          SurveyHomePage(),
          SurveyQuestionScreen(),
          SurveyOutletScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required int index,
    VoidCallback? onTap,
  }) {
    final bool isSelected = _selectedIndex == index;
    final Color iconColor =
        isSelected
            ? Theme.of(context).primaryColor
            : Theme.of(context).iconTheme.color ?? Colors.grey;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: Icon(icon, color: iconColor, size: 24.w),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          color:
              isSelected
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).textTheme.bodyMedium?.color,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      onTap:
          onTap ??
          () {
            if (index >= 0) {
              setState(() {
                _selectedIndex = index;
                _pageController.jumpToPage(index);
              });
            }
            Navigator.pop(context);
          },
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
