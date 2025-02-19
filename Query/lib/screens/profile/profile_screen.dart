import 'package:flutter/material.dart';
import 'package:my_flutter_app/constants/app_color.dart';
import 'package:my_flutter_app/constants/bottom_nav_bar.dart';
import 'package:my_flutter_app/screens/auth/login_screen.dart';
import 'package:my_flutter_app/screens/plans/plan_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullName = 'John Doe';
  bool isDarkMode = true;
  bool notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? 'John Doe';
    });
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Color(0xFF171720),
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                logout(context);
              },
              child: const Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.foreground,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              //
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF292935),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullName,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      const Text('Class 10 - CBSE',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildPremiumButton(context),
            const SizedBox(height: 24),

            // Academic Settings
            const Text("Academic Settings",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 12),
            _buildSettingsCard([
              _buildSettingItem("Change Board", "CBSE"),
              _buildSettingItem("Change Class", "10th"),
              _buildSettingItem("Manage Subjects", null, hasArrow: true),
            ]),

            const SizedBox(height: 24),

            // App Settings
            const Text("App Settings",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 12),
            _buildSettingsCard([
              _buildToggleItem("Dark Mode", isDarkMode, (value) {
                setState(() {
                  isDarkMode = value;
                });
              }),
              _buildToggleItem("Notifications", notificationsEnabled, (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              }),
              _buildSettingItem("Language", "English"),
            ]),

            const SizedBox(height: 24),

            // Account Settings
            const Text("Account",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 12),
            _buildSettingsCard([
              _buildSettingItem("Privacy Policy", null, hasArrow: true),
              _buildSettingItem("Terms of Service", null, hasArrow: true),
            ]),

            const SizedBox(height: 20),
            _buildSettingsCard([
              _buildSettingItem("Logout", null,
                  hasArrow: false,
                  isDanger: true,
                  onTap: () => _showLogoutConfirmation(context)),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 3),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF292935),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingItem(String title, String? value,
      {bool hasArrow = false, bool isDanger = false, VoidCallback? onTap}) {
    return Material(
      color: isDanger ? Colors.red : Colors.transparent,
      shape: isDanger
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: InkWell(
        onTap: onTap,
        splashColor: Color(0xFF1E1E2A),
        highlightColor: Color(0xFF1E1E2A),
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          title: Text(title, style: const TextStyle(color: Colors.white)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (value != null)
                Text(value,
                    style: const TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.bold)),
              if (hasArrow)
                const Icon(Icons.arrow_forward_ios,
                    color: Colors.grey, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleItem(String title, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: AppColors.primary,
        activeColor: AppColors.white,
      ),
    );
  }

  Widget _buildPremiumButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlansScreen()),
            );
          },
          child: const Text(
            "Go to Premium Plans",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
