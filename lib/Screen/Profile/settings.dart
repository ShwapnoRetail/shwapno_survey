import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: const Text("Zahed Hasan"),
              subtitle: const Text("zahed@example.com"),
              trailing: const Icon(Icons.edit),
              onTap: () {
                // Navigate to profile edit screen (future enhancement)
              },
            ),
          ),
          const SizedBox(height: 20),

          // Account Settings
          const Text(
            "Account Settings",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
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
          const SizedBox(height: 20),

          // Notifications
          const Text(
            "Notifications",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text("Push Notifications"),
            value: notificationsEnabled,
            activeColor: Colors.indigo,
            onChanged: (value) {
              setState(() => notificationsEnabled = value);
            },
          ),
          const SizedBox(height: 20),

          // Appearance
          const Text(
            "Appearance",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: darkModeEnabled,
            activeColor: Colors.indigo,
            onChanged: (value) {
              setState(() => darkModeEnabled = value);
            },
          ),
          const SizedBox(height: 20),

          // Support
          const Text("Support", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
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
          const SizedBox(height: 20),

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
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      leading: Icon(icon, color: Colors.indigo),
      title: Text(title, style: TextStyle(color: textColor ?? Colors.black)),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
