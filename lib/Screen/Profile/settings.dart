import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          // Profile Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            elevation: 2,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              leading: CircleAvatar(
                radius: 24.r,
                backgroundColor: Colors.indigo,
                child: Icon(Icons.person, size: 20.w, color: Colors.white),
              ),
              title: Text(
                "Zahed Hasan",
                style: TextStyle(fontSize: 16.sp),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                "zahed@example.com",
                style: TextStyle(fontSize: 12.sp),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(Icons.edit, size: 20.w),
              onTap: () {},
            ),
          ),
          SizedBox(height: 20.h),

          // Account Settings
          Text(
            "Account Settings",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(height: 8.h),
          SettingsTile(
            icon: Icons.lock,
            title: "Change Password",
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.language,
            title: "Language",
            subtitle: "English",
            onTap: () {},
          ),
          SizedBox(height: 20.h),

          // Notifications
          Text(
            "Notifications",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(height: 8.h),
          SwitchListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
            title: Text(
              "Push Notifications",
              style: TextStyle(fontSize: 14.sp),
            ),
            value: notificationsEnabled,
            activeColor: Colors.indigo,
            onChanged: (value) {
              setState(() => notificationsEnabled = value);
            },
          ),
          SizedBox(height: 20.h),

          // Appearance
          Text(
            "Appearance",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(height: 8.h),
          SwitchListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
            title: Text("Dark Mode", style: TextStyle(fontSize: 14.sp)),
            value: darkModeEnabled,
            activeColor: Colors.indigo,
            onChanged: (value) {
              setState(() => darkModeEnabled = value);
            },
          ),
          SizedBox(height: 20.h),

          // Support
          Text(
            "Support",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(height: 8.h),
          SettingsTile(
            icon: Icons.help_outline,
            title: "Help & Support",
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: "Privacy Policy",
            onTap: () {},
          ),
          SizedBox(height: 20.h),

          // Logout
          SettingsTile(
            icon: Icons.logout,
            title: "Logout",
            textColor: Colors.red,
            onTap: () {
              // Show confirmation dialog
            },
          ),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final Color? textColor;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      minLeadingWidth: 24.w,
      leading: Icon(icon, color: Colors.indigo, size: 20.w),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          color: textColor ?? Colors.black,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle:
          subtitle != null
              ? Text(
                subtitle!,
                style: TextStyle(fontSize: 12.sp),
                overflow: TextOverflow.ellipsis,
              )
              : null,
      trailing: Icon(Icons.arrow_forward_ios, size: 16.w),
      onTap: onTap,
    );
  }
}
